//
//  RXCheckView.m
//  YYTS
//
//  Created by Rush.D.Xzj on 15/9/16.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXCheckView.h"

@interface RXCheckView ()

@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *selectedImageName;

@property (nonatomic, strong) UIImageView *iv;

@property (nonatomic, strong) UIView *vBg;

@property (nonatomic, assign) E_RX_CheckViewAlign e_RX_CheckViewAlign;

@end

@implementation RXCheckView

- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    NSString *imageName = selected ? self.selectedImageName : self.imageName;
    self.iv.image = [UIImage imageNamed:imageName];
}

- (void)updateWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName text:(NSString *)text align:(E_RX_CheckViewAlign)align
{
    [self updateWithImageName:imageName selectedImageName:selectedImageName text:text align:align offset:0];
}

- (void)updateWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName text:(NSString *)text align:(E_RX_CheckViewAlign)align offset:(CGFloat)offset
{
    [self.vBg removeFromSuperview];
    self.imageName = imageName;
    self.selectedImageName = selectedImageName;
    self.lbl.text = text;
    [self.lbl sizeToFit];
    UIImage *image = [UIImage imageNamed:imageName];
    CGFloat ivWidth = image.size.width;
    CGFloat ivHeight = image.size.height;
    
    CGFloat lblWidth = self.lbl.frame.size.width;
    CGFloat lblHeight = self.lbl.frame.size.height;
    
    CGFloat height = self.frame.size.height;
    
    CGFloat ivY = (height - ivHeight) / 2.0f;
    CGFloat lblY = (height - lblHeight) / 2.0f;
    CGFloat lblX = ivWidth + offset;
    
    self.e_RX_CheckViewAlign = align;
    
    
    self.iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, ivY, ivWidth, ivHeight)];
    self.lbl.frame = CGRectMake(lblX, lblY, lblWidth, lblHeight);
    self.vBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ivWidth + lblWidth, height)];
    [self.vBg addSubview:self.iv];
    [self.vBg addSubview:self.lbl];
    
    [self addSubview:self.vBg];
    
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat width = self.frame.size.width;
    CGFloat vBgX = 0;
    switch (self.e_RX_CheckViewAlign) {
        case kE_RX_CheckViewAlign_Left:
            vBgX = 0;
            break;
        case kE_RX_CheckViewAlign_Right:
            vBgX = width - self.vBg.frame.size.width;
            break;
        case kE_RX_CheckViewAlign_Center:
            vBgX = (width - self.vBg.frame.size.width) / 2.0f;
            break;
        default:
            break;
    }
    CGRect vBgFrame = self.vBg.frame;
    vBgFrame.origin.x = vBgX;
    self.vBg.frame = vBgFrame;
}


- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initialize];
}

- (void)initialize
{
    self.lbl = [[UILabel alloc] initWithFrame:CGRectZero];
}










@end