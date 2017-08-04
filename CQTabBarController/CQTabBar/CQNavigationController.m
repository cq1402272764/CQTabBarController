//
//  CQNavigationController.m
//  CQTabBarController
//
//  Created by yto on 2017/8/3.
//  Copyright © 2017年 CQ. All rights reserved.
//

#import "CQNavigationController.h"

@interface CQNavigationController ()<UINavigationControllerDelegate>
@property (nonatomic, strong) id popDelegate;
@end

@implementation CQNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;

}

// 滑动返回
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (viewController == self.viewControllers[0]) { // 显示根控制器
        self.interactivePopGestureRecognizer.delegate = _popDelegate;
    }else{
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}

+ (void)initialize{
    UINavigationBar *navbar = [UINavigationBar appearance];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [navbar setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBackgroundImage:nil
                                       forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
//    // 去掉底部黑线
//    UIImage *image = [[UIImage alloc] init];
//    [navbar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//    navbar.barStyle = UIBarStyleBlackOpaque;
//    navbar.translucent = NO;
    
    // 设置文字颜色
    NSMutableDictionary *textAtts = [NSMutableDictionary dictionary];
    textAtts[NSForegroundColorAttributeName] = [UIColor blackColor];
    [navbar setTitleTextAttributes:textAtts];
    
    // 设置baritem的文字颜色
    NSMutableDictionary *itemAtts = [NSMutableDictionary dictionary];
    itemAtts[NSForegroundColorAttributeName] = [UIColor blackColor];
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    [item setTitleTextAttributes:itemAtts forState:UIControlStateNormal];
}

@end
