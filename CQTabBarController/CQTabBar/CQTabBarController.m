//
//  CQTabBarController.m
//  CQTabBarController
//
//  Created by yto on 2017/7/21.
//  Copyright © 2017年 CQ. All rights reserved.
//

#import "CQTabBarController.h"
#import "CQNavigationController.h"
#import "CQTabBar.h"

@interface CQTabBarController ()
@property (nonatomic, strong) CQTabBar *baseTabBar;
@end

@implementation CQTabBarController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

- (CQTabBar *)baseTabBar{
    if (_baseTabBar == nil) {
        _baseTabBar = [[CQTabBar alloc] init];
        _baseTabBar.frame = self.tabBar.bounds;
        [self.tabBar addSubview:_baseTabBar];
    }
    return _baseTabBar;
}

/**
 *  初始化一个子控制器
 *
 *  @param navigationController        导航控制器类(默认使用CQNavigationController)
 *  @param controller                  子控制器类
 *  @param title                       显示的标题文字
 *  @param normalImageName             未选中的图标
 *  @param selectedImageName           选中的图标
 */
- (void)setupAllChildViewNavigationController:(Class)navigationController Controllers:(Class)controller title:(NSString *)title normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName{
    if (controller == nil) return;
    UIViewController *vc = [[controller alloc] init];
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:normalImageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    UINavigationController *navVC;
    if (navigationController != nil) {
        navVC = [[navigationController alloc] initWithRootViewController:vc];
    }else{
        navVC = [[CQNavigationController alloc] initWithRootViewController:vc];
    }
    [self addChildViewController:navVC];
    [self.baseTabBar addTabBarButtonWithItem:vc.tabBarItem];
}

@end
