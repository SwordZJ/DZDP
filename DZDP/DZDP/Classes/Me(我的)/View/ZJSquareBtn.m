//
//  ZJSquareBtn.m
//
//  Created by liuzhouji on 15/9/7.
//  Copyright (c) 2015年 ZJ. All rights reserved.


#import "ZJSquareBtn.h"

@implementation ZJSquareBtn

-(void)awakeFromNib{
    [self setup];
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

-(void)setup{
    // 按钮初始化设置
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}
// 重设内部子控件
-(void)layoutSubviews{
    [super layoutSubviews];
    // 设置imageView的位置
    self.imageView.width = self.currentImage.size.width;
    self.imageView.height = self.imageView.width;
    self.imageView.centerY = self.imageView.height * 0.5 + 5;
    self.imageView.centerX = self.width * 0.5;
    // 设置标签的位置
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.imageView.height;
    self.titleLabel.x = 0;
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame);
}


@end
