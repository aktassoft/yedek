//
//  ViewController.m
//  InsanKaynaklari
//
//  Created by Mobiloyunlar on 12/20/12.
//  Copyright (c) 2012 Mobiloyunlar. All rights reserved.
//

#import "ViewController.h"
#import "SoruBankasiViewController.h"
#import "ClothTransition.h"
#import "CalendarViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize topView, transition;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *storyMenuItemImage = [UIImage imageNamed:@"bg-menuitem.png"];
    UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-menuitem-highlighted.png"];
    
 //   UIImage *storyMenuItemImage = [UIImage imageNamed:@"menuframe.png"];
 //   UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"menuframe.png"];

    
    UIImage *starImage1 = [UIImage imageNamed:@"sorubankasi.png"];
    UIImage *starImage2 = [UIImage imageNamed:@"calendar.png"];
    UIImage *starImage3 = [UIImage imageNamed:@"interview.png"];
    UIImage *starImage4 = [UIImage imageNamed:@"hakkinda.png"];
    
    AwesomeMenuItem *starMenuItem1 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage1
                                                    highlightedContentImage:nil
                                      text:@"Soru Bankası"];
    AwesomeMenuItem *starMenuItem2 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage2
                                                    highlightedContentImage:nil
                                      text:@"Takvim"];
    AwesomeMenuItem *starMenuItem3 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage3
                                                    highlightedContentImage:nil
                                      text:@"Kılavuz"];
    AwesomeMenuItem *starMenuItem4 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage4
                                                    highlightedContentImage:nil
                                      text:@"Hakkında"];
    
    
    
    NSArray *menus = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, starMenuItem3, starMenuItem4, nil];
    
    [starMenuItem1 release];
    [starMenuItem2 release];
    [starMenuItem3 release];
    [starMenuItem4 release];
    
    
    menu = [[AwesomeMenu alloc] initWithFrame:self.view.bounds menus:menus];
    
	// customize menu
	/*
     menu.rotateAngle = M_PI/3;
     menu.menuWholeAngle = M_PI;
     menu.timeOffset = 0.2f;
     menu.farRadius = 180.0f;
     menu.endRadius = 100.0f;
     menu.nearRadius = 50.0f;
     */
	
    menu.delegate = self;
    [self.view addSubview:menu];
   // [menu release];
	// Do any additional setup after loading the view, typically from a nib.

  /*  UIImage *my3dImage = [AwesomeMenuItem create3DImageWithText:@"MOBİL KARİYER" Font:[UIFont fontWithName:@"MarkerFelt-Wide" size:27] ForegroundColor:[UIColor colorWithRed:(255/255.f) green:(255/255.f) blue:(255/255.f) alpha:1.0] ShadowColor:[UIColor clearColor] outlineColor:[UIColor colorWithRed:(255/255.f) green:(255/255.f) blue:(255/255.f) alpha:1.0] depth:1];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:my3dImage];
    CGPoint center = topView.center;
    center.x += 45;
    imgView.center = center;
    
    [topView addSubview: imgView];
    
    [imgView release];*/
}

- (void) viewWillAppear:(BOOL)animated {
    
    
    menu.expanding = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)AwesomeMenu:(AwesomeMenu *)menu didSelectIndex:(NSInteger)idx
{
    NSLog(@"Select the index : %d",idx);
    
    switch (idx) {
        case 0: {SoruBankasiViewController *soruBankasiController = [[SoruBankasiViewController alloc] initWithNibName:@"SoruBankasiViewController" bundle:nil];
            
            //  [self presentModalViewController:soruBankasiController animated:YES];
            
            self.transition = [[[ClothTransition alloc] init] autorelease];
            
            [[HMGLTransitionManager sharedTransitionManager] setTransition:transition];
            //	newController.delegate = self;
            
            [[HMGLTransitionManager sharedTransitionManager] presentModalViewController:soruBankasiController onViewController:self];
            
            [soruBankasiController release];
            
        }
            break;
            
        case 1: {CalendarViewController *calendarController = [[CalendarViewController alloc] initWithNibName:@"CalendarViewController" bundle:nil];
            
         //     [self presentModalViewController:calendarController animated:YES];
            
            self.transition = [[[ClothTransition alloc] init] autorelease];
            
            [[HMGLTransitionManager sharedTransitionManager] setTransition:transition];
            //	newController.delegate = self;
            
            [[HMGLTransitionManager sharedTransitionManager] presentModalViewController:calendarController onViewController:self];
            
          
            
            [calendarController release];
            
        }

            
        default:
            break;
    
    }
        
    
 //   [self performSelector:@selector(openMainMenu) withObject:nil afterDelay:2];
}

-(void) openMainMenu {
    
    menu.expanding = YES;
    
}

/*- (UIImage *)create3DImageWithText:(NSString *)_text Font:(UIFont*)_font ForegroundColor:(UIColor*)_foregroundColor ShadowColor:(UIColor*)_shadowColor outlineColor:(UIColor*)_outlineColor depth:(int)_depth {
    
    //calculate the size we will need for our text
    CGSize expectedSize = [_text sizeWithFont:_font constrainedToSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    
    //increase our size, as we will draw in 3d, so we need extra space for 3d depth + shadow with blur
    expectedSize.height+=_depth+5;
    expectedSize.width+=_depth+5;
    
    UIColor *_newColor;
    
    UIGraphicsBeginImageContextWithOptions(expectedSize, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //because we want to do a 3d depth effect, we are going to slightly decrease the color as we move back
    //so here we are going to create a color array that we will use with required depth levels
    NSMutableArray *_colorsArray = [[NSMutableArray alloc] initWithCapacity:_depth];
    
    CGFloat *components =  (CGFloat *)CGColorGetComponents(_foregroundColor.CGColor);
    
    //add as a first color in our array the original color
    [_colorsArray insertObject:_foregroundColor atIndex:0];
    
    //create a gradient of our color (darkening in the depth)
    int _colorStepSize = floor(100/_depth);
    
    for (int i=0; i<_depth; i++) {
        
        for (int k=0; k<3; k++) {
            if (components[k]>(_colorStepSize/255.f)) {
                components[k]-=(_colorStepSize/255.f);
            }
        }
        _newColor = [UIColor colorWithRed:components[0] green:components[1] blue:components[2] alpha:CGColorGetAlpha(_foregroundColor.CGColor)];
        
        //we are inserting always at first index as we want this array of colors to be reversed (darkest color being the last)
        [_colorsArray insertObject:_newColor atIndex:0];
    }
    
    //we will draw repeated copies of our text, with the outline color and foreground color, starting from the deepest
    for (int i=0; i<_depth; i++) {
        
        //change color
        _newColor = (UIColor*)[_colorsArray objectAtIndex:i];
        
        //draw the text
        CGContextSaveGState(context);
        
        CGContextSetShouldAntialias(context, YES);
        
        //draw outline if this is the last layer (front one)
        if (i+1==_depth) {
            CGContextSetLineWidth(context, 1);
            CGContextSetLineJoin(context, kCGLineJoinRound);
            
            CGContextSetTextDrawingMode(context, kCGTextStroke);
            [_outlineColor set];
            [_text drawAtPoint:CGPointMake(i, i) withFont:_font];
        }
        
        //draw filling
        [_newColor set];
        
        CGContextSetTextDrawingMode(context, kCGTextFill);
        
        //if this is the last layer (first one we draw), add the drop shadow too and the outline
        if (i==0) {
            CGContextSetShadowWithColor(context, CGSizeMake(-2, -2), 4.0f, _shadowColor.CGColor);
        }
        else if (i+1!=_depth){
            //add glow like blur
            CGContextSetShadowWithColor(context, CGSizeMake(-1, -1), 3.0f, _newColor.CGColor);
        }
        
        [_text drawAtPoint:CGPointMake(i, i) withFont:_font];
        CGContextRestoreGState(context);
    }
    
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return finalImage;
}*/


- (void) dealloc {
    
    [menu release];
    [topView release];
    [super dealloc];
}


- (void)viewDidUnload {
    [self setTopView:nil];
    [super viewDidUnload];
}
@end
