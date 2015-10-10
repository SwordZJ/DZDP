//
//  ZJLoginViewController.m
//  DZDP
//
//  Created by liuzhouji on 15/10/9.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJLoginViewController.h"
#import "ZJRegisterViewController.h"
@interface ZJLoginViewController ()

@end

@implementation ZJLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
}


- (void)setupNav{
    
    self.navigationItem.title = @"无密码快捷登录";
    // 左边退出按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"Homepage_Delete_Shop_D"] forState:UIControlStateNormal];
    [btn sizeToFit];
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    [btn addTarget:self action:@selector(cancleClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    // 右边注册按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"注册" titleColor:[UIColor orangeColor] selectedTitleColor:nil image:nil selectedBackgroudImage:nil target:self action:@selector(registerBtnClick)];
}


#pragma mark - 按钮点击事件
- (void)cancleClick{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)registerBtnClick{
    // 弹出注册界面
    [self.navigationController pushViewController:[[ZJRegisterViewController alloc] init] animated:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
