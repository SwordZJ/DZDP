//
//  ZJBaseNavController.m
//  DZDP
//
//  Created by liuzhouji on 15/9/8.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJBaseNavController.h"

@interface ZJBaseNavController ()<UIGestureRecognizerDelegate>

@end

@implementation ZJBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置全视图返回手势
    self.interactivePopGestureRecognizer.delegate = self;
    
    // 设置返回item样式
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count > 0) { // 判断不是导航控制器根控制器
        viewController.hidesBottomBarWhenPushed = YES;
        // 设置返回item样式
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"NaviBack"] forState:UIControlStateNormal];
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [btn sizeToFit];
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    [super pushViewController:viewController animated:animated];
}

-(void)back{
    [self popViewControllerAnimated:YES];
}

#pragma mark - UIGestureRecognizerDelegate
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return self.childViewControllers.count > 1;
}



@end
