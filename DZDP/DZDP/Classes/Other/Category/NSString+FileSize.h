//
//  NSString+FileSize.h
//  BSBDJ
//
//  Created by liuzhouji on 15/9/7.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FileSize)
/**
 *  根据当前字符串文件或文件夹计算大小
 */
-(NSUInteger)fileSize;
@end
