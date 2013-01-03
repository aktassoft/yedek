//
//  ViewController.h
//  InsanKaynaklari
//
//  Created by Mobiloyunlar on 12/20/12.
//  Copyright (c) 2012 Mobiloyunlar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AwesomeMenu.h"
#import "HMGLTransitionManager.h"

@interface ViewController : UIViewController <AwesomeMenuDelegate> {
    
    AwesomeMenu *menu;
    HMGLTransition *transition;
    
}
@property (retain, nonatomic) IBOutlet UIView *topView;

@property (nonatomic, retain) HMGLTransition *transition;


@end
