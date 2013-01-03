//
//  AwesomeMenuItem.m
//  AwesomeMenu
//
//  Created by Levey on 11/30/11.
//  Copyright (c) 2011 Levey & Other Contributors. All rights reserved.
//

#import "AwesomeMenuItem.h"
#import <QuartzCore/QuartzCore.h>
static inline CGRect ScaleRect(CGRect rect, float n) {return CGRectMake((rect.size.width - rect.size.width * n)/ 2, (rect.size.height - rect.size.height * n) / 2, rect.size.width * n, rect.size.height * n);}
@implementation AwesomeMenuItem



@synthesize contentImageView = _contentImageView;

@synthesize startPoint = _startPoint;
@synthesize endPoint = _endPoint;
@synthesize nearPoint = _nearPoint;
@synthesize farPoint = _farPoint;
@synthesize delegate  = _delegate;

#pragma mark - initialization & cleaning up
- (id)initWithImage:(UIImage *)img 
   highlightedImage:(UIImage *)himg
       ContentImage:(UIImage *)cimg
highlightedContentImage:(UIImage *)hcimg
text:(NSString *)ltext;
{
    if (self = [super init]) 
    {
        
        
                
        [self setBackgroundImage:cimg forState:UIControlStateNormal];
        self.adjustsImageWhenHighlighted = YES;
        self.showsTouchWhenHighlighted = YES;
        
        self.backgroundColor = [UIColor clearColor];
        [[self layer] setBorderWidth:2.0f];
        [[self layer] setBorderColor:[UIColor blueColor].CGColor];
        self.layer.cornerRadius = 10.0;
       
    //    self.image = img;
        
    //    self.highlightedImage = himg;
        self.userInteractionEnabled = YES;
    //    _contentImageView = [[UIImageView alloc] initWithImage:cimg];
    //    _contentImageView.highlightedImage = hcimg;
    //    _contentImageView.layer.cornerRadius = 23.5;
    //    _contentImageView.clipsToBounds = YES;
     //   [self addSubview:_contentImageView];
            
 /*      UILabel *menulabel = [[UILabel alloc] init];
        
     //   float width = _contentImageView.image.size.width;
     //   float height = _contentImageView.image.size.height;
        menulabel.frame = CGRectMake(0,self.frame.size.height/2,200,64);
        
        menulabel.text = ltext;
        menulabel.backgroundColor = [UIColor clearColor];
        menulabel.textAlignment = UITextAlignmentCenter;
            menulabel.center = CGPointMake(self.frame.size.width / 2 + 25, self.frame.size.height + 75);
        menulabel.textColor = [UIColor blackColor];
        
       
        
        [self addSubview:menulabel];
        [menulabel release];*/
        
        
        
        
        UIImage *my3dImage = [AwesomeMenuItem create3DImageWithText:ltext Font:[UIFont fontWithName:@"MarkerFelt-Wide" size:22] ForegroundColor:[UIColor colorWithRed:(25/255.f) green:(25/255.f) blue:(112/255.f) alpha:1.0] ShadowColor:[UIColor whiteColor] outlineColor:[UIColor colorWithRed:(25/255.f) green:(25/255.f) blue:(112/255.f) alpha:1.0] depth:1];
        
        UIImageView *imgView = [[UIImageView alloc] initWithImage:my3dImage];
        CGPoint center = self.center;
        center.x += 32;
        center.y += 75;
        imgView.center = center;
        
        [self addSubview: imgView];
        
        [imgView release];

        
       
       
        
    }
    return self;
}

- (void)dealloc
{
    [_contentImageView release];
    [super dealloc];
}
#pragma mark - UIView's methods
- (void)layoutSubviews
{
    [super layoutSubviews];
    
  //  self.bounds = CGRectMake(0, 0, self.image.size.width, self.image.size.height);
    
    self.bounds = CGRectMake(0, 0, 50, 64);
    
    float width = _contentImageView.image.size.width;
    float height = _contentImageView.image.size.height;
    _contentImageView.frame = CGRectMake(self.bounds.size.width/2 - width/2, self.bounds.size.height/2 - height/2, width, height);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
       
    
    self.highlighted = YES;
    if ([_delegate respondsToSelector:@selector(AwesomeMenuItemTouchesBegan:)])
    {
       [_delegate AwesomeMenuItemTouchesBegan:self];
    }
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // if move out of 2x rect, cancel highlighted.
    CGPoint location = [[touches anyObject] locationInView:self];
    if (!CGRectContainsPoint(ScaleRect(self.bounds, 2.0f), location))
    {
        self.highlighted = NO;
    }
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
    
    self.highlighted = NO;
    // if stop in the area of 2x rect, response to the touches event.
    CGPoint location = [[touches anyObject] locationInView:self];
    if (CGRectContainsPoint(ScaleRect(self.bounds, 2.0f), location))
    {
        if ([_delegate respondsToSelector:@selector(AwesomeMenuItemTouchesEnd:)])
        {
            [_delegate AwesomeMenuItemTouchesEnd:self];
        }
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = NO;
}

#pragma mark - instant methods
- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [_contentImageView setHighlighted:highlighted];
}

+ (UIImage *)create3DImageWithText:(NSString *)_text Font:(UIFont*)_font ForegroundColor:(UIColor*)_foregroundColor ShadowColor:(UIColor*)_shadowColor outlineColor:(UIColor*)_outlineColor depth:(int)_depth {
    
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
}




@end
