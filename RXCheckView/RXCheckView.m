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


@property (nonatomic, strong) UIView *backgroundView;

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *imageView;


@property (nonatomic, assign) E_RX_CheckViewAlign e_RX_CheckViewAlign;

@property (nonatomic, assign) CGFloat offset;


@property (nonatomic, strong) UITapGestureRecognizer *tgr;

@end

@implementation RXCheckView


- (void)setTapEnable:(BOOL)tapEnable
{
    _tapEnable = tapEnable;
    if (tapEnable) {
        [self addGestureRecognizer:self.tgr];
    } else {
        [self removeGestureRecognizer:self.tgr];
    }
}

- (void)tgrAction:(id)sender
{
    self.selected = !self.selected;
}
- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    NSString *imageName = selected ? self.selectedImageName : self.imageName;
    self.imageView.image = [UIImage imageNamed:imageName];
}

- (void)updateWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName text:(NSString *)text align:(E_RX_CheckViewAlign)align
{
    [self updateWithImageName:imageName selectedImageName:selectedImageName text:text align:align offset:0];
}

- (void)updateWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName text:(NSString *)text align:(E_RX_CheckViewAlign)align offset:(CGFloat)offset
{
    [self.backgroundView removeFromSuperview];
    self.imageName = imageName;
    self.selectedImageName = selectedImageName;
    self.label.text = text;
    self.e_RX_CheckViewAlign = align;
    self.offset = offset;
    [self refreshView];
}

- (void)refreshView
{
    [self.backgroundView removeFromSuperview];
    
    [self.label sizeToFit];
    UIImage *image = [UIImage imageNamed:self.imageName];
    CGFloat ivWidth = image.size.width;
    CGFloat ivHeight = image.size.height;
    
    CGFloat lblWidth = self.label.frame.size.width;
    CGFloat lblHeight = self.label.frame.size.height;
    
    CGFloat height = self.frame.size.height;
    
    CGFloat ivY = (height - ivHeight) / 2.0f;
    CGFloat lblY = (height - lblHeight) / 2.0f;
    CGFloat lblX = ivWidth + self.offset;
        
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, ivY, ivWidth, ivHeight)];
    self.label.frame = CGRectMake(lblX, lblY, lblWidth, lblHeight);
    self.backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ivWidth + lblWidth, height)];
    [self.backgroundView addSubview:self.imageView];
    [self.backgroundView addSubview:self.label];
    
    
    self.selected = self.selected;
    
    
    CGFloat width = self.frame.size.width;
    CGFloat vBgX = 0;
    switch (self.e_RX_CheckViewAlign) {
        case kE_RX_CheckViewAlign_Left:
            vBgX = 0;
            break;
        case kE_RX_CheckViewAlign_Right:
            vBgX = width - self.backgroundView.frame.size.width;
            break;
        case kE_RX_CheckViewAlign_Center:
            vBgX = (width - self.backgroundView.frame.size.width) / 2.0f;
            break;
        default:
            break;
    }
    CGRect vBgFrame = self.backgroundView.frame;
    vBgFrame.origin.x = vBgX;
    self.backgroundView.frame = vBgFrame;
    
    [self addSubview:self.backgroundView];
}




- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }
    return self;
}


- (void)initialize
{
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.selected = NO;
    self.tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tgrAction:)];
    
    self.backgroundColor = [UIColor clearColor];
    self.label.backgroundColor = [UIColor clearColor];
    self.tapEnable = YES;
}











@end
