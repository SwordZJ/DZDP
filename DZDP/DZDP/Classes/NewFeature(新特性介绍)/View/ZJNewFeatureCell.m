//
//  ZJNewFeatureCell.m
//  DZDP
//
//  Created by liuzhouji on 15/9/7.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJNewFeatureCell.h"
#import "ZJNewFeatureBtn.h"
#import <Masonry.h>
#import "ZJTabBarController.h"

@interface ZJNewFeatureCell ()
@property (nonatomic, weak) ZJNewFeatureBtn *jumpBtn;
@property (nonatomic, weak) UIButton *startBtn;
@property (nonatomic, weak) UILabel *nameTextLabel;
@property (nonatomic, weak) UILabel *subTextLabel;
@property (nonatomic, weak) UIImageView *iconView;
@end



@implementation ZJNewFeatureCell


-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        ZJNewFeatureBtn *btn = [ZJNewFeatureBtn buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:btn];
        self.jumpBtn = btn;
        [btn addTarget:self action:@selector(jumpBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *nameTextLabel = [[UILabel alloc] init];
        self.nameTextLabel = nameTextLabel;
        nameTextLabel.font = [UIFont boldSystemFontOfSize:30];
        nameTextLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:nameTextLabel];
        
        UILabel *subTextLabel = [[UILabel alloc] init];
        self.subTextLabel = subTextLabel;
        subTextLabel.font = [UIFont boldSystemFontOfSize:20];
        subTextLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:subTextLabel];
        
        UIImageView *iconView = [[UIImageView alloc] init];
        self.iconView = iconView;
        iconView.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:iconView];
        
        UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.startBtn = startBtn;
        [startBtn setImage:[UIImage imageNamed:@"03_guide_button"] forState:UIControlStateNormal];
        [startBtn addTarget:self action:@selector(jumpBtnClick) forControlEvents:UIControlEventTouchUpInside];
       [self.contentView addSubview:startBtn];
        
    }
    return self;
}

// 跳转到主页
-(void)jumpBtnClick{
    // 重设窗口的根控制器
//    [UIView animateWithDuration:1.0 animations:^{
//        [UIApplication sharedApplication].keyWindow.rootViewController= nil;
//    } completion:^(BOOL finished) {
            [UIApplication sharedApplication].keyWindow.rootViewController = [[ZJTabBarController alloc] init];
//    }];

}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    // 设置约束
    self.jumpBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.jumpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(30);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
    }];
    
    self.nameTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.nameTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.jumpBtn.mas_bottom).offset(20);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    self.subTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.subTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameTextLabel.mas_bottom).offset(20);
        make.centerX.equalTo(self.nameTextLabel.mas_centerX);
    }];
    
    self.iconView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.width.equalTo(@200);
        make.height.equalTo(@200);
    }];
    
    self.startBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(self.mas_bottom).offset(-100);
    }];
//    ZJLog(@"%@",NSStringFromCGRect(self.startBtn.frame));
    [self.startBtn sizeToFit];
}

-(void)setNameText:(NSString *)nameText{
    _nameText = nameText;
    self.nameTextLabel.text = nameText;
}

-(void)setSubText:(NSString *)subText{
    _subText = subText;
    self.subTextLabel.text = subText;
}

-(void)setIcon:(NSString *)icon{
    _icon = icon;
    if (icon == nil) return;
    self.iconView.image = [UIImage imageNamed:icon];
}


-(void)showBtn{
    self.startBtn.hidden = NO;
    self.jumpBtn.hidden = YES;
}
-(void)hideBtn{
    self.startBtn.hidden = YES;
    self.jumpBtn.hidden = NO;
}
@end
