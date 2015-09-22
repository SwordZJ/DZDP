//
//  NSString+SandboxPath.m
//  07-多图片缓存技术
//
//  Created by liuzhouji on 15/8/22.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

/*
 检索指定路径
 第一个参数指定了搜索的路径名称,NSDocumentDirectory表示是在Documents中寻找.NSCacheDirectory的话就是在cache文件中寻找.
 第二个参数限定了文件的检索范围只在沙箱内部.其意义为用户电脑主目录.也可以修改为网络主机等.
 第三个参数决定了是否展开波浪线符号.展开后才是完整路径,这个布尔值一直为YES.
 该方法返回值为一个数组,在iphone中由于只有一个唯一路径(相对OC而言),所以直接取数组第一个元素即可.
 NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
 */

// NSString+SandboxPath.m
#import "NSString+SandboxPath.h"

@implementation NSString (SandboxPath)

-(instancetype)cacheDir{
    // 1.获取caches目录
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    // 2.拼接路径
    return [path stringByAppendingPathComponent:self];
}



-(instancetype)docDir{
    // 1.获取doc目录
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) firstObject];
    // 2.拼接路径
    return [path stringByAppendingPathComponent:self];
}

-(instancetype)tmpDir{
    // 1.获取tmp目录
    NSString *path = NSTemporaryDirectory();
    // 2.拼接路径
    return [path stringByAppendingPathComponent:self];

}
@end
