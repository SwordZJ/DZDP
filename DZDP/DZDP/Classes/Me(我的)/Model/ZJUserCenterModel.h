//
//  ZJUserCenterModel.h
//  DZDP
//
//  Created by liuzhouji on 15/9/8.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJUserCenterModel : NSObject
/**
 * 名称
 */
@property (nonatomic, copy) NSString *Title;
/**
 *  图标地址
 */
@property (nonatomic, copy) NSString *IconUrl;
/**
 *  当前组
 */
@property (nonatomic, assign) NSInteger Group;

/**
 *  组尾标题
 */
@property (nonatomic, copy) NSString *SubTitle;

@end
