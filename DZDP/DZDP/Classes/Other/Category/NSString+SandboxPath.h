//
//  NSString+SandboxPath.h
//  07-多图片缓存技术
//
//  Created by liuzhouji on 15/8/22.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SandboxPath)

// 用于生成文件在caches目录中的路径
- (instancetype)cacheDir;
// 用于生成文件在document目录中的路径
- (instancetype)docDir;
// 用于生成文件在temp目录中的路径
- (instancetype)tmpDir;

@end
