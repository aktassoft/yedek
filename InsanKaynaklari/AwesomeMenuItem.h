//
//  AwesomeMenuItem.h
//  AwesomeMenu
//
//  Created by Levey on 11/30/11.
//  Copyright (c) 2011 Levey & Other Contributors. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol AwesomeMenuItemDelegate;

@interface AwesomeMenuItem : UIButton
{
    UIImageView *_contentImageView;
    CGPoint _startPoint;
    CGPoint _endPoint;
    CGPoint _nearPoint; // near
    CGPoint _farPoint; // far
    
    
    
       
       
    
    
    id<AwesomeMenuItemDelegate> _delegate;
}



@property (nonatomic, retain, readonly) UIImageView *contentImageView;

@property (nonatomic) CGPoint startPoint;
@property (nonatomic) CGPoint endPoint;
@property (nonatomic) CGPoint nearPoint;
@property (nonatomic) CGPoint farPoint;

@property (nonatomic, assign) id<AwesomeMenuItemDelegate> delegate;

- (id)initWithImage:(UIImage *)img 
   highlightedImage:(UIImage *)himg
       ContentImage:(UIImage *)cimg
highlightedContentImage:(UIImage *)hcimg
text:(NSString *) ltext;


+ (UIImage *)create3DImageWithText:(NSString *)_text Font:(UIFont*)_font ForegroundColor:(UIColor*)_foregroundColor ShadowColor:(UIColor*)_shadowColor outlineColor:(UIColor*)_outlineColor depth:(int)_depth;

@end

@protocol AwesomeMenuItemDelegate <NSObject>
- (void)AwesomeMenuItemTouchesBegan:(AwesomeMenuItem *)item;
- (void)AwesomeMenuItemTouchesEnd:(AwesomeMenuItem *)item;
@end