//
//  NSString+FileSize.m
//  BSBDJ
//
//  Created by liuzhouji on 15/9/7.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "NSString+FileSize.h"

@implementation NSString (FileSize)
/**
 *  根据当前字符串文件或文件夹计算大小
 */
-(NSUInteger)fileSize{
    NSFileManager *manager = [NSFileManager defaultManager];
   
    BOOL isDirectory = NO;
    BOOL exist = [manager fileExistsAtPath:self isDirectory:&isDirectory];
    // 判断当前文件是否是存在
    if (exist == NO) return 0;
    // 判断当前路径是否是文件或者文件夹
    if (isDirectory) { // 文件夹
        NSDirectoryEnumerator *enumerator = [manager enumeratorAtPath:self];
        NSInteger size = 0;
        for (NSString *subpath in enumerator) {
            NSString *fullPath = [self stringByAppendingPathComponent:subpath];
            size += [manager attributesOfItemAtPath:fullPath error:nil].fileSize;
        }
        return size;
    }else{ // 文件
        return [manager attributesOfItemAtPath:self error:nil].fileSize;
    }
}



// 计算文件大小的两种方法
-(void)getSize2{
    // 计算当前缓存
    NSString *filePath = [@"default" cacheDir];
    NSFileManager *manager = [NSFileManager defaultManager];
    NSDirectoryEnumerator *enumerator = [manager enumeratorAtPath:filePath];
    NSInteger size = 0;
    for (NSString *subpath in enumerator) {
        NSString *fullPath = [filePath stringByAppendingPathComponent:subpath];
        size += [manager attributesOfItemAtPath:fullPath error:nil].fileSize;
    }
    ZJLog(@"%zd",size);
}

-(void)getSize{
    // 计算当前缓存
    NSString *filePath = [@"default" cacheDir];
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *subpaths = [manager subpathsAtPath:filePath];
    ZJLog(@"%@",subpaths);
    NSInteger size = 0;
    for (NSString *subpath in subpaths) {
        NSString *fullPath = [filePath stringByAppendingPathComponent:subpath];
        size += [manager attributesOfItemAtPath:fullPath error:nil].fileSize;
    }
    ZJLog(@"%zd",size);
}
@end
