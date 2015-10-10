//
//  ZJUserBtn.m
//  DZDP
//
//  Created by liuzhouji on 15/10/9.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJUserBtn.h"

@implementation ZJUserBtn

-(void)setHighlighted:(BOOL)highlighted{}



-(void)awakeFromNib{
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
}
@end
