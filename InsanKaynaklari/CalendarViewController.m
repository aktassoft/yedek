//
//  CalendarViewController.m
//  InsanKaynaklari
//
//  Created by Mobiloyunlar on 12/30/12.
//  Copyright (c) 2012 Mobiloyunlar. All rights reserved.
//

#import "CalendarViewController.h"
#import "HMGLTransitionManager.h"
#import "ClothTransition.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController
@synthesize calendarTab;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self.view addSubview:calendarTab.view];
    
    
    UIImage *buttonImage = [UIImage imageNamed:@"homebutton"];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
  //  [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    
    CGFloat heightDifference = buttonImage.size.height - self.calendarTab.tabBar.frame.size.height;
    if (heightDifference < 0)
        button.center = self.calendarTab.tabBar.center;
    else
    {
        CGPoint center = self.calendarTab.tabBar.center;
        center.y = center.y - heightDifference/2.0 - 10;
        button.center = center;
    }
    
    [button addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    buttonImage = [UIImage imageNamed:@"weekicon"];
    
    UIButton* button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button1 setBackgroundImage:buttonImage forState:UIControlStateNormal];
    //  [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    
    
    if (heightDifference < 0)
        button1.center = self.calendarTab.tabBar.center;
    else
    {
        CGPoint center = self.calendarTab.tabBar.center;
        center.y = center.y - heightDifference/2.0 -10;
        center.x = center.x - 80;
        button1.center = center;
    }
    
    [button1 addTarget:self action:@selector(changeVc1) forControlEvents:UIControlEventTouchUpInside];
    
    
    buttonImage = [UIImage imageNamed:@"dayicon"];
    
    UIButton* button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button2 setBackgroundImage:buttonImage forState:UIControlStateNormal];
    //  [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    
    
    if (heightDifference < 0)
        button2.center = self.calendarTab.tabBar.center;
    else
    {
        CGPoint center = self.calendarTab.tabBar.center;
        center.y = center.y - heightDifference/2.0 -10;
        center.x = center.x + 80;
        button2.center = center;
    }
    
    [button2 addTarget:self action:@selector(changeVc2) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    
    
    
    [self.view addSubview:button];
    
    [self.view addSubview:button1];
    
    [self.view addSubview:button2];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [calendarTab release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setCalendarTab:nil];
    [super viewDidUnload];
}

- (void) closeView {
    
    
    
    
	[[HMGLTransitionManager sharedTransitionManager] setTransition:[[[ClothTransition alloc] init] autorelease]];
	[[HMGLTransitionManager sharedTransitionManager] dismissModalViewController:self];
    
    
    
}



- (void) changeVc1 {
    
    
   self.calendarTab.selectedViewController = [self.calendarTab.viewControllers objectAtIndex:0];
    
    
    
}

- (void) changeVc2 {
    
    
    self.calendarTab.selectedViewController = [self.calendarTab.viewControllers objectAtIndex:1];
    
    
    
}


@end
