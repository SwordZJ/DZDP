//
//  ZJUserCenterCell.m
//  DZDP
//
//  Created by liuzhouji on 15/9/8.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJUserCenterCell.h"
#import "ZJUserCenterModel.h"
#import <UIImageView+WebCache.h>
@implementation ZJUserCenterCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}


-(void)setModel:(ZJUserCenterModel *)model{
    _model = model;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.IconUrl] placeholderImage:[UIImage imageNamed:@"wm_list_pic_restpic"]];
    self.textLabel.text = model.Title;

}

@end
