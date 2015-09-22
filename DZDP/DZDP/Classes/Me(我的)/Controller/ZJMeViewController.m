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
    
    [self.tableView registerClass:[ZJUserCenterCell class] forCellReuseIdentifier:ZJUserCellId];
    


    ZJMeHeaderView *headerView = [ZJMeHeaderView meHeaderView];
    // 设置不自动调整头部视图的位置
    headerView.autoresizingMask = UIViewAutoresizingNone;
    self.tableView.tableHeaderView = headerView;
    
    ZJMeFooterView *footerView = [ZJMeFooterView meFooterView];
    self.tableView.tableFooterView = footerView;
    
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 10;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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


//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    if (section == self.userGroups.count - 1) {
//        return 70;
//    }
//    return 0;
//}
//
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    if (section == self.userGroups.count - 1) {
//       
//    }
//    return nil;
//}

@end
