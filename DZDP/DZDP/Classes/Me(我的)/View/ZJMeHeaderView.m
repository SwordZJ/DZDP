//
//  ZJMeHeaderView.m
//  DZDP
//
//  Created by liuzhouji on 15/9/10.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJMeHeaderView.h"
#import "ZJLoginViewController.h"
#import "ZJBaseNavController.h"

@implementation ZJMeHeaderView

+(instancetype)meHeaderView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}

#pragma mark - 按钮点击事件
- (IBAction)userBtnClick {
    [self popLoginVc];
    
}
- (IBAction)myCommentBtnClick {
    [self popLoginVc];
}

- (IBAction)myFollowBtnClick {
     [self popLoginVc];
}

- (IBAction)myCouponBtnClick {
    [self popLoginVc];
}


-(void)popLoginVc{
    ZJLoginViewController *loginVc = [[ZJLoginViewController alloc] init];
    
    ZJBaseNavController *nav = [[ZJBaseNavController alloc] initWithRootViewController:loginVc];
    // 获取当前导航控制器
    if ([self.window.rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *rootVc = (UITabBarController *)self.window.rootViewController;
        [rootVc presentViewController:nav animated:YES completion:nil];
    }
}
@end
