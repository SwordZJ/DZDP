//
//  NSString+Version.h
//  DZDP
//
//  Created by liuzhouji on 15/9/8.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "NSString+Version.h"

static NSString *const ZJVersion = @"version";
static NSString *const ZJVersionDict = @"CFBundleShortVersionString";
@implementation NSString (Version)

+(instancetype)getCurrentVersion{
    return [NSBundle mainBundle].infoDictionary[ZJVersionDict];
}

+(instancetype)getPreviousVersion{
    return [[NSUserDefaults standardUserDefaults] valueForKeyPath:ZJVersion];
}

-(void)saveVersion{
    [[NSUserDefaults standardUserDefaults] setValue:self forKeyPath:ZJVersion];
}
+(void)clearCurrentVersion{
    [[NSUserDefaults standardUserDefaults] setValue:nil forKeyPath:ZJVersion];
}
@end
