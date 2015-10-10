//
//  ZJMessageViewController.m
//  DZDP
//
//  Created by liuzhouji on 15/10/9.
//  Copyright © 2015年 ZJ. All rights reserved.
//

#import "ZJMessageViewController.h"
#import "ZJUserBtn.h"

@interface ZJMessageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *userMessageTable;
@property (weak, nonatomic) IBOutlet UITableView *userSystemTable;
@property (weak, nonatomic) IBOutlet UITableView *userNoticeTable;

/**当前选中按钮*/
@property (nonatomic, strong) UIButton *selectedBtn;
@property (weak, nonatomic) IBOutlet ZJUserBtn *userMessageBtn;
@end

@implementation ZJMessageViewController

static NSString *const userMessageID = @"messageCell";
static NSString *const userSystemID = @"systemCell";
static NSString *const userNoticeID = @"noticeCell";
- (void)viewDidLoad {
    [super viewDidLoad];

    // 初始化表格
    [self setupTable];

    // 默认选中第一个按钮
    [self userMessageClick:self.userMessageBtn];
}

- (void)viewWillAppear:(BOOL)animated{
    self.userSystemTable.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.userNoticeTable.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
}
-(void)setupTable{
    [self.userMessageTable registerClass:[UITableViewCell class] forCellReuseIdentifier:userMessageID];
    [self.userSystemTable registerClass:[UITableViewCell class] forCellReuseIdentifier:userSystemID];
    [self.userNoticeTable registerClass:[UITableViewCell class] forCellReuseIdentifier:userNoticeID];
    
    // 设置自动拉伸失效
    self.userMessageTable.autoresizingMask = UIViewAutoresizingNone;
    self.userSystemTable.autoresizingMask = UIViewAutoresizingNone;
    self.userNoticeTable.autoresizingMask = UIViewAutoresizingNone;
}

#pragma mark - 按钮点击事件
- (IBAction)userMessageClick:(UIButton *)sender {
    [self selecedBtn:sender];
    self.navigationItem.title = sender.currentTitle;
    self.userMessageTable.hidden = NO;
    self.userSystemTable.hidden = YES;
    self.userNoticeTable.hidden = YES;
}

- (IBAction)systemMessageClick:(UIButton *)sender{
    [self selecedBtn:sender];
    self.navigationItem.title = sender.currentTitle;
    self.userMessageTable.hidden = YES;
    self.userSystemTable.hidden = NO;
    self.userNoticeTable.hidden = YES;
}
- (IBAction)noticeMessageClick:(UIButton *)sender{
    [self selecedBtn:sender];
    self.navigationItem.title = sender.currentTitle;
    self.userMessageTable.hidden = YES;
    self.userSystemTable.hidden = YES;
    self.userNoticeTable.hidden = NO;
}


// 按钮选中状态转换
- (void)selecedBtn:(UIButton *)btn{
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.userMessageTable) { // 用户消息
        return 5;
    }else if (tableView == self.userSystemTable){ // 系统消息
        return 10;
    }else{ // 广播
        return 20;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.userMessageTable) { // 用户消息
        //    1.创建cell
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:userMessageID];
        //    2.设置cell的数据
        cell.imageView.image = [UIImage imageNamed:@"findhome_shoppingmall"];
        cell.textLabel.text = [NSString stringWithFormat:@"用户消息--%zd",indexPath.row];
        //    3.返回cell
        return cell;
    }else if (tableView == self.userSystemTable){ // 系统消息
        //    1.创建cell
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:userSystemID];
        //    2.设置cell的数据
        cell.imageView.image = [UIImage imageNamed:@"findhome_20150731181239yiyuan"];
        cell.textLabel.text = [NSString stringWithFormat:@"系统消息--%zd",indexPath.row];
        //    3.返回cell
        return cell;
    }else{ // 广播
        //    1.创建cell
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:userNoticeID];
        //    2.设置cell的数据
        cell.imageView.image = [UIImage imageNamed:@"findhome_car"];
        cell.textLabel.text = [NSString stringWithFormat:@"广播消息--%zd",indexPath.row];
        //    3.返回cell
        return cell;
    }

}

@end
