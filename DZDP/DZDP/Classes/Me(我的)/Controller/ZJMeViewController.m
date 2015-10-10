//
//  ZJMeViewController.m
//  DZDP
//
//  Created by liuzhouji on 15/9/8.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJMeViewController.h"
#import "ZJUserCenterCell.h"
#import "ZJUserCenterModel.h"
#import "ZJUserGroupsModel.h"
#import "ZJMeFooterView.h"
#import "ZJMeHeaderView.h"
#import "ZJHelpWebViewController.h"
#import "ZJMessageViewController.h"
#import <MJExtension.h>


@interface ZJMeViewController ()
// 组模型数组
@property (nonatomic, strong) NSArray *userGroups;


@end

@implementation ZJMeViewController

/**
 * 懒加载
 */
- (NSArray *)userGroups{
    if (!_userGroups) {
        NSMutableArray *arrM = [NSMutableArray array];
        // 获取模型数组
        [ZJUserGroupsModel setupObjectClassInArray:^NSDictionary *{
            return @{@"group":[ZJUserCenterModel class]};
        }];
        arrM = [ZJUserGroupsModel objectArrayWithFilename:@"usercenter-preload.plist"];
        _userGroups = [arrM copy];
    }
    return _userGroups;
}

static NSString *const ZJUserCellId = @"userCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    
    [self setupTable];
    
}
- (void)setupNav
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"客服中心" titleColor:ZJColor(253, 130, 45) selectedTitleColor:nil image:nil selectedBackgroudImage:nil target:self action:@selector(helpClick)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"personal_icon_send" selectedImage:nil target:self action:@selector(messageClick)];
}
// 初始化子控件
- (void)setupTable{
    
    [self.tableView registerClass:[ZJUserCenterCell class] forCellReuseIdentifier:ZJUserCellId];
    
    self.tableView.backgroundColor = ZJDefaultColor;
    
    ZJMeHeaderView *headerView = [ZJMeHeaderView meHeaderView];
    // 设置不自动调整头部视图的位置
    headerView.autoresizingMask = UIViewAutoresizingNone;
    self.tableView.tableHeaderView = headerView;
    
    ZJMeFooterView *footerView = [ZJMeFooterView meFooterView];
    self.tableView.tableFooterView = footerView;
    
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 10;
}


#pragma mark - 事件处理
/**
 *  客服按钮点击，加载客服界面
 */
- (void)helpClick{
    ZJHelpWebViewController *helpVc = [[ZJHelpWebViewController alloc] init];
    [self.navigationController pushViewController:helpVc animated:YES];
}
/**
 *  消息按钮点击事件，弹出消息控制器
 */
- (void)messageClick{
    ZJMessageViewController *messageVc = [[ZJMessageViewController alloc] init];
    [self.navigationController pushViewController:messageVc animated:YES];
}


#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.userGroups.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    ZJUserGroupsModel *group = self.userGroups[section];
    return group.group.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZJUserCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:ZJUserCellId];
    ZJUserGroupsModel *group = self.userGroups[indexPath.section];
    cell.model = group.group[indexPath.row];
    return cell;
}


#pragma mark - 代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
