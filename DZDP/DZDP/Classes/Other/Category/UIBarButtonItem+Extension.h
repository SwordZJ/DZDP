//
//  UIBarButtonItem+Extension.h
//  工具类
//
//  Created by liuzhouji on 15/8/31.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+(UIBarButtonItem *)itemWithBackgroudImage:(NSString *)image selectedBackgroudImage:(NSString *)selectedImage target:(id)target action:(SEL)action;


+(UIBarButtonItem *)itemWithTitle:(NSString *)title image:(NSString *)image selectedBackgroudImage:(NSString *)selectedImage target:(id)target action:(SEL)action;


+(UIBarButtonItem *)itemWithTitle:(NSString *)title titleColor:(UIColor *)color selectedTitleColor:(UIColor *)selColor image:(NSString *)image selectedBackgroudImage:(NSString *)selectedImage target:(id)target action:(SEL)action;
@end
