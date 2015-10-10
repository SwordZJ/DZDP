//
//  UIBarButtonItem+Extension.h
//  工具类
//
//  Created by liuzhouji on 15/8/31.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
/**
 *  根据传入的参数创建只有图片的UIBarButtonItem
 *
 *  @param image         背景图片
 *  @param selectedImage 选中背景图片
 *  @param target        点击要执行方法的对象
 *  @param action        点击 要执行的方法
 *
 */
+(UIBarButtonItem *)itemWithBackgroudImage:(NSString *)image selectedBackgroudImage:(NSString *)selectedImage target:(id)target action:(SEL)action;

/**
 *  根据传入参数创建带标题和背景图片的UIBarButtonItem
 *
 *  @param title         标题
 *  @param image         按钮图片
 *  @param selectedImage 按钮高亮图片
 *  @param target        点击要执行方法的对象
 *  @param action        点击要执行的方法
 *
 */
+(UIBarButtonItem *)itemWithTitle:(NSString *)title image:(NSString *)image selectedBackgroudImage:(NSString *)selectedImage target:(id)target action:(SEL)action;

/**
 *  根据传入参数创建带文字和图片以及背景图片的UIBarButtonItem
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
+(UIBarButtonItem *)itemWithTitle:(NSString *)title titleColor:(UIColor *)color selectedTitleColor:(UIColor *)selColor image:(NSString *)image selectedBackgroudImage:(NSString *)selectedImage target:(id)target action:(SEL)action;

/**
 *  根据传入的图片生成只有图片的UIBarButtonItem
 *
 *  @param image    正常图片
 *  @param selImage 选中图片
 *  @param target   点击要执行方法的对象
 *  @param action   点击要执行的方法
 *
 */
+(UIBarButtonItem *)itemWithImage:(NSString *)image selectedImage:(NSString *)selImage target:(id)target action:(SEL)action;
@end
