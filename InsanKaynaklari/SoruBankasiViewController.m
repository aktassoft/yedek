//
//  SoruBankasiViewController.m
//  InsanKaynaklari
//
//  Created by Mobiloyunlar on 12/20/12.
//  Copyright (c) 2012 Mobiloyunlar. All rights reserved.
//

#import "SoruBankasiViewController.h"
#import "HMGLTransitionManager.h"
#import "ClothTransition.h"

@interface SoruBankasiViewController ()

@end

@implementation SoruBankasiViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeView:(id)sender {
    
  //  [self dismissModalViewControllerAnimated:YES];
    
    
	[[HMGLTransitionManager sharedTransitionManager] setTransition:[[[ClothTransition alloc] init] autorelease]];
	[[HMGLTransitionManager sharedTransitionManager] dismissModalViewController:self];
    
    
}
@end
