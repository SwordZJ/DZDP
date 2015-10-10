//
//  AppDelegate.m
//  DZDP
//
//  Created by liuzhouji on 15/9/7.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "AppDelegate.h"
#import "ZJTabBarController.h"
#import "UMSocial.h"
#import "ZJNewFeatureViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIViewController *rootVc = nil;
    // 判断当前版本是否为新版本
    // 1.获取当前版本和此前版本信息
    NSString *curVersion = [NSString getCurrentVersion];
    NSString *previousVersion = [NSString getPreviousVersion];
    // 2.判断版本信息是否为最新
    if ([previousVersion isEqualToString:curVersion]) {// 此前版本和当前版本一致,直接进入主页
        rootVc = [[ZJTabBarController alloc] init];
    }else{ // 若是不一致，则需要提示用户当前版本为新版本，并且保存新版本
        rootVc = [[ZJNewFeatureViewController alloc] init];
        [curVersion saveVersion];
    }

    self.window.rootViewController = rootVc;
    
    [self.window makeKeyAndVisible];
    
    
    // 友盟分享
    [UMSocialData setAppKey:@"56187933e0f55aa8430009e3"];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [UMSocialSnsService handleOpenURL:url];
}
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return  [UMSocialSnsService handleOpenURL:url];
}

@end
