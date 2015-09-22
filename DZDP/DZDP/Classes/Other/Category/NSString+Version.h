//
//  NSString+Vesrion.h
//  DZDP
//
//  Created by liuzhouji on 15/9/8.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Version)
/**
 *   获取当前app版本
 */
+(instancetype)getCurrentVersion;
/**
 *   获取上一次app版本
 */
+(instancetype)getPreviousVersion;
/**
 *  保存当前app版本
 */
-(void)saveVersion;
/**
 *  清空当前版本信息
 */
+(void)clearCurrentVersion;
@end
