//
//  RXCheckView.h
//  YYTS
//
//  Created by Rush.D.Xzj on 15/9/16.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum E_RX_CheckViewAlign {
    kE_RX_CheckViewAlign_Left,
    kE_RX_CheckViewAlign_Center,
    kE_RX_CheckViewAlign_Right,
}E_RX_CheckViewAlign;


@interface RXCheckView : UIView
@property (nonatomic, readonly) UIView *backgroundView;
@property (nonatomic, readonly) UILabel *label;
@property (nonatomic, readonly) UIImageView *imageView;


- (void)updateWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName text:(NSString *)text align:(E_RX_CheckViewAlign)align;



- (void)updateWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName text:(NSString *)text align:(E_RX_CheckViewAlign)align offset:(CGFloat)offset;

- (void)refreshView;


// 点击事件是否有效, 默认是YES
@property (nonatomic, assign) BOOL tapEnable;

// 默认是 NO
@property (nonatomic, assign) BOOL selected;

@end
