//
//  CQTabBarController.h
//  CQTabBarController
//
//  Created by yto on 2017/7/21.
//  Copyright © 2017年 CQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CQTabBarController : UITabBarController

// 未选中时的字体大小(默认11号)
@property (nonatomic, assign) CGFloat normalFount;
// 选中时的字体大小(默认11号)
@property (nonatomic, assign) CGFloat selectedFount;
// 未选中时的字体颜色(默认灰色)
@property (nonatomic, assign) CGFloat normalColor;
// 选中时的字体颜色(默认蓝色)
@property (nonatomic, assign) CGFloat selectedColor;
// 提醒数字的背景色(默认红色)
@property (nonatomic, weak) UIColor *color;

/**
 *  初始化一个子控制器
 *
 *  @param navigationController        导航控制器(默认使用CQNavigationController)
 *  @param controller                  子控制器类
 *  @param title                       显示的标题文字
 *  @param normalImageName             未选中的图标
 *  @param selectedImageName           选中的图标
 */
- (void)setupAllChildViewNavigationController:(Class)navigationController Controllers:(Class)controller title:(NSString *)title normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName;

@end
