//
//  ZJTabBarController.m
//  DZDP
//
//  Created by liuzhouji on 15/9/7.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJTabBarController.h"
#import "ZJBaseNavController.h"
#import "ZJMeViewController.h"
#import "ZJHomeTableViewController.h"

@interface ZJTabBarController ()

@end

@implementation ZJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加子控制器
    [self addChildVcWithChildVc:[[ZJHomeTableViewController alloc] initWithStyle:UITableViewStyleGrouped] Title:@"首页" image:@"home_footbar_icon_dianping" selectedImage:@"home_footbar_icon_dianping_pressed"];
    
    [self addChildVcWithChildVc:[[UIViewController alloc] init] Title:@"闪惠团购" image:@"home_footbar_icon_group" selectedImage:@"home_footbar_icon_group_pressed"];
    
    [self addChildVcWithChildVc:[[UIViewController alloc] init] Title:@"发现" image:@"home_footbar_icon_found" selectedImage:@"home_footbar_icon_found_pressed"];
    
    [self addChildVcWithChildVc:[[ZJMeViewController alloc] initWithStyle:UITableViewStyleGrouped] Title:@"我的" image:@"home_footbar_icon_my" selectedImage:@"home_footbar_icon_my_pressed"];
}


/**
 *  创建tabBar子控制器
 *
 *  @param Vc            子控制器
 *  @param title         tarBar标题
 *  @param image         tabBar图片
 *  @param selectedImage tabBar选中图片
 */
-(void)addChildVcWithChildVc:(UIViewController *)vc Title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    // 包装导航控制器
    ZJBaseNavController *baseBav = [[ZJBaseNavController alloc] initWithRootViewController:vc];
    vc.title = title;
    baseBav.tabBarItem.image = [UIImage imageNamed:image];
    baseBav.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:baseBav];
}

/**
 *  初始化TabBar文字属性
 */
+(void)initialize{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor grayColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    NSMutableDictionary *selectedDict = [NSMutableDictionary dictionary];
    selectedDict[NSForegroundColorAttributeName] = ZJColor(255, 78, 30);
    selectedDict[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:dict forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedDict forState:UIControlStateSelected];
}

@end
