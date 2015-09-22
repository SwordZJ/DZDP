//
//  ZJMeHeaderView.m
//  DZDP
//
//  Created by liuzhouji on 15/9/10.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJMeHeaderView.h"

@implementation ZJMeHeaderView

+(instancetype)meHeaderView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
}

#pragma mark - 按钮点击事件
- (IBAction)userBtnClick {
    
    
    
}
- (IBAction)myCommentBtnClick {
}
- (IBAction)myFollowBtnClick {
}

- (IBAction)myCouponBtnClick {
}

@end
