//
//  UIImage+ComposedPicture.m
//  DZDP
//
//  Created by liuzhouji on 15/9/8.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "UIImage+ComposedPicture.h"

@implementation UIImage (ComposedPicture)
-(void)getImage{
    UIImage *image = [UIImage imageNamed:@"02_guide_ticket"];
    UIImage *image1 = [UIImage imageNamed:@"02_guide_tuan"];
    UIImage *image2 = [UIImage imageNamed:@"02_guide_money"];
    UIImage *image3 = [UIImage imageNamed:@"02_guide_movie"];
    
    CGSize size = CGSizeMake(image.size.width + 30, image.size.height + 30);
    UIGraphicsBeginImageContext(size);
    CGRect rect = CGRectMake(15, 15, image.size.width, image.size.height);
    CGRect rect1 = CGRectMake(0, size.height * 0.5 - image1.size.height * 0.5 + 8, image1.size.width, image1.size.height);
    CGRect rect2 = CGRectMake(size.width*0.5 - image2.size.width*0.5 - 15, 0, image2.size.width, image2.size.height);
    CGRect rect3 = CGRectMake(size.width - image3.size.width, 0, image3.size.width, image3.size.height);
    [image drawInRect:rect];
    [image1 drawInRect:rect1];
    [image2 drawInRect:rect2];
    [image3 drawInRect:rect3];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    NSData *data = UIImagePNGRepresentation(newImage);
    [data writeToFile:@"/Users/liuzhouji/Desktop/2.png" atomically:YES];
    
}
@end
