//
//  AppDelegate.m
//  DZDP
//
//  Created by liuzhouji on 15/9/7.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "AppDelegate.h"
#import "ZJTabBarController.h"
#import "ZJNewFeatureViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIViewController *rootVc = nil;
    [NSString clearCurrentVersion];
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
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
