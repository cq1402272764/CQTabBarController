//
//  MainTabBarController.m
//  QunBao
//
//  Created by fujunzhi on 16/11/3.
//  Copyright © 2016年 QunBao. All rights reserved.
//

#import "MainTabBarController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"


@interface MainTabBarController ()
@end

@implementation MainTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildControllers];
}


- (void)setUpChildControllers{
    [self setupAllChildViewNavigationController:nil Controllers:[ViewController1 class] title:@"首页" normalImageName:nil selectedImageName:nil];
    [self setupAllChildViewNavigationController:nil Controllers:[ViewController2 class] title:@"首页1" normalImageName:nil selectedImageName:nil];
    [self setupAllChildViewNavigationController:nil Controllers:[ViewController3 class] title:@"首页2" normalImageName:nil selectedImageName:nil];
}



@end




