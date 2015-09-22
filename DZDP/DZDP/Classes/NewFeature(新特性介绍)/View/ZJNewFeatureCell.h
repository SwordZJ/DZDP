//
//  ZJNewFeatureCell.h
//  DZDP
//
//  Created by liuzhouji on 15/9/7.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJNewFeatureCell : UICollectionViewCell
// 标题
@property (nonatomic, copy) NSString *nameText;
// 子标题
@property (nonatomic, copy) NSString *subText;
// 图片名称
@property (nonatomic, copy) NSString *icon;


-(void)hideBtn;
-(void)showBtn;
@end
