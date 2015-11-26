//
//  MainViewController.m
//  RXCheckViewExample
//
//  Created by Rush.D.Xzj on 15/11/20.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController



- (UIImage *)rx_imageWithSize:(CGSize)size color:(UIColor *)color
{
    UIImage *img = nil;
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (IBAction)btnOK:(id)sender
{
    BOOL hidden = [UIApplication sharedApplication].statusBarHidden;
    [[UIApplication sharedApplication] setStatusBarHidden:!hidden withAnimation:UIStatusBarAnimationSlide];
    
    CGRect rect = self.navigationController.navigationBar.frame;
    rect.origin.y = 20;
    self.navigationController.navigationBar.frame = rect;
    
    
    CGRect frame1 = self.view.frame;
    frame1.origin.y = 64;
    self.view.frame = frame1;
    
    UIImage *bgImage = [self rx_imageWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 44) color:[UIColor redColor]];
    [self.navigationController.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsCompact];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
