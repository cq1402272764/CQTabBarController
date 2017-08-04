//
//  CQTabBar.m
//  CQTabBarController
//
//  Created by yto on 2017/7/21.
//  Copyright © 2017年 CQ. All rights reserved.
//

#import "CQTabBar.h"
#import "CQTabBarBtn.h"

@interface CQTabBar ()
@property (nonatomic, weak) UIButton *selectedButton;
@end

@implementation CQTabBar

- (void)addTabBarButtonWithItem:(UITabBarItem *)item{
    CQTabBarBtn *tabBarBtn = [[CQTabBarBtn alloc] init];
    [self addSubview:tabBarBtn];
    tabBarBtn.item = item;
    [tabBarBtn addTarget:self action:@selector(tabBarBtnClick:) forControlEvents:UIControlEventTouchDown];
    if (self.subviews.count == 1) {
        [self tabBarBtnClick:tabBarBtn];
    }
}

- (void)tabBarBtnClick:(UIButton *)btn{
    self.selectedButton.selected = NO;
    btn.selected = YES;
    self.selectedButton = btn;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    // 按钮的frame
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonY = 0;
    for (int index = 0; index<self.subviews.count; index++) {
        CQTabBarBtn *button = self.subviews[index];
        CGFloat buttonX = index * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.tag = index;
    }
}


@end
