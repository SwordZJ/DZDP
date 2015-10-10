//
//  ZJHomeTableViewController.m
//  DZDP
//
//  Created by liuzhouji on 15/10/9.
//  Copyright © 2015年 ZJ. All rights reserved.
//

#import "ZJHomeTableViewController.h"
#import "ZJHomeHeaderView.h"
@interface ZJHomeTableViewController ()

@end

@implementation ZJHomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTable];
}

- (void)setupTable{
    
    ZJHomeHeaderView *headerView = [ZJHomeHeaderView viewFromXib];
    
    self.tableView.tableHeaderView = headerView;
    
}

@end
