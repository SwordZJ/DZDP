//
//  UIBarButtonItem+Extension.m
//  工具类
//
//  Created by liuzhouji on 15/8/31.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
/**
 *  根据传入的参数创建UIBarButtonItem
 *
 *  @param title         标题
 *  @param image         背景图片
 *  @param selectedImage 选中背景图片
 *  @param target        点击要执行方法的对象
 *  @param action        点击 要执行的方法
 *
 */

+(UIBarButtonItem *)itemWithBackgroudImage:(NSString *)image selectedBackgroudImage:(NSString *)selectedImage target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:btn];
}


/**
 *  根据传入参数创建UIBarButtonItem
 *
 *  @param title         标题
 *  @param image         按钮图片
 *  @param selectedImage 按钮高亮图片
 *  @param target        点击要执行方法的对象
 *  @param action        点击要执行的方法
 *
 */
+(UIBarButtonItem *)itemWithTitle:(NSString *)title image:(NSString *)image selectedBackgroudImage:(NSString *)selectedImage target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:btn];
}

/**
 *  根据传入参数创建UIBarButtonItem
 *
 *  @param title         标题
 *  @param color         标题颜色
 *  @param selColor      高亮标题颜色
 *  @param image         按钮图片
 *  @param selectedImage 按钮高亮图片
 *  @param target        点击要执行方法的对象
 *  @param action        点击要执行的方法
 *
 */
+(UIBarButtonItem *)itemWithTitle:(NSString *)title titleColor:(UIColor *)color selectedTitleColor:(UIColor *)selColor image:(NSString *)image selectedBackgroudImage:(NSString *)selectedImage target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setTitleColor:selColor forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:btn];
}
@end
