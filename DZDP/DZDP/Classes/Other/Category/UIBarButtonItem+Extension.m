//
//  UIBarButtonItem+Extension.m
//  工具类
//
//  Created by liuzhouji on 15/8/31.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+(UIBarButtonItem *)itemWithBackgroudImage:(NSString *)image selectedBackgroudImage:(NSString *)selectedImage target:(id)target action:(SEL)action{
    UIButton *btn = [self btnWithTitle:nil titleColor:nil selectedColor:nil image:image selectedImage:nil selectedBackgroundImage:selectedImage target:target action:action];
    return [[self alloc] initWithCustomView:btn];
}

+(UIBarButtonItem *)itemWithTitle:(NSString *)title image:(NSString *)image selectedBackgroudImage:(NSString *)selectedImage target:(id)target action:(SEL)action{
    UIButton *btn = [self btnWithTitle:title titleColor:nil selectedColor:nil image:nil selectedImage:selectedImage selectedBackgroundImage:nil target:target action:action];
    return [[self alloc] initWithCustomView:btn];
}


+(UIBarButtonItem *)itemWithTitle:(NSString *)title titleColor:(UIColor *)color selectedTitleColor:(UIColor *)selColor image:(NSString *)image selectedBackgroudImage:(NSString *)selectedImage target:(id)target action:(SEL)action{
    UIButton *btn = [self btnWithTitle:title titleColor:color selectedColor:selColor image:image selectedImage:selectedImage selectedBackgroundImage:nil target:target action:action];
    return [[self alloc] initWithCustomView:btn];
}


+(UIBarButtonItem *)itemWithImage:(NSString *)image selectedImage:(NSString *)selImage target:(id)target action:(SEL)action{
    UIButton *btn = [self btnWithTitle:nil titleColor:nil selectedColor:nil image:image selectedImage:selImage selectedBackgroundImage:nil target:target action:action];
    return [[self alloc] initWithCustomView:btn];
}


+ (UIButton *)btnWithTitle:(NSString *)title titleColor:(UIColor *)color selectedColor:(UIColor *)selColor image:(NSString *)image selectedImage:(NSString *)selImage selectedBackgroundImage:(NSString *)selBackImage target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setTitleColor:selColor forState:UIControlStateHighlighted];
    if (image.length) {
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    if (selImage.length) {
        [btn setImage:[UIImage imageNamed:selImage] forState:UIControlStateHighlighted];
    }
    if (selBackImage.length) {
        [btn setBackgroundImage:[UIImage imageNamed:selBackImage] forState:UIControlStateHighlighted];
    }
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
@end
