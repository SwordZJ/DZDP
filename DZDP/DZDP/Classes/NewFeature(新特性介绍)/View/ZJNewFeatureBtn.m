//
//  ZJNewFeatureBtn.m
//  DZDP
//
//  Created by liuzhouji on 15/9/8.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJNewFeatureBtn.h"

@implementation ZJNewFeatureBtn

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageNamed:@"bookingonline_add"] forState:UIControlStateNormal];
        [self setTitle:@"跳过" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        [self setImage:[UIImage imageNamed:@"Arrow_Left"] forState:UIControlStateNormal];
        self.imageView.contentMode = UIViewContentModeLeft;
    }
    return self;
}


// 布局子控件
-(void)layoutSubviews{
    [super layoutSubviews];
    

    // 设置imageView的位置
    self.imageView.height = self.height - 4;
    self.imageView.width = self.imageView.height;
    self.imageView.y = 2;
    self.imageView.x = self.width - self.imageView.width;

    // 设置label的位置
    self.titleLabel.width = self.imageView.x;
    self.titleLabel.height = self.height;
    self.titleLabel.x = 0;
    self.titleLabel.y = 0;
    
    
}
@end
