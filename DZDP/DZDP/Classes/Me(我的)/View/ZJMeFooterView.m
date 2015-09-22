//
//  ZJMeFooterView.m
//  DZDP
//
//  Created by liuzhouji on 15/9/10.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJMeFooterView.h"

@interface ZJMeFooterView ()
@property (weak, nonatomic) IBOutlet UILabel *l1;
@property (weak, nonatomic) IBOutlet UILabel *l2;

@end

@implementation ZJMeFooterView

+(instancetype)meFooterView{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}

@end
