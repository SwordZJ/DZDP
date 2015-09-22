//
//  ZJNewFeatureViewController.m
//  DZDP
//
//  Created by liuzhouji on 15/9/7.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJNewFeatureViewController.h"
#import "ZJNewFeatureCell.h"
#import <Masonry.h>

#define kGuideCount 3


@interface ZJNewFeatureViewController ()
@property (nonatomic, weak) UIPageControl *pageControl;// 页面控制
@end

@implementation ZJNewFeatureViewController

static NSString * const ZJNewFeatureCellId = @"newFeatureCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    
    [self setupPageControl];
    
}
// 初始化设置
-(void)setup{
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    // 注册cell
    [self.collectionView registerClass:[ZJNewFeatureCell class] forCellWithReuseIdentifier:ZJNewFeatureCellId];
}

// 添加pageControl控件
-(void)setupPageControl{
    // 添加pageControl
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    pageControl.numberOfPages = kGuideCount;
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    // 设置约束
    pageControl.translatesAutoresizingMaskIntoConstraints = NO;
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
}

// 初始化布局
-(instancetype)init{
    // 创建流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 设置尺寸
    layout.itemSize = kScreenSize;
    // 设置cell间距
    layout.minimumLineSpacing = 0;
    // 设置滚动方向(水平方向)
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [super initWithCollectionViewLayout:layout];
}





#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return kGuideCount;
}


/** 颜色设置
 第一页 254 206 53
 第二页 91 181 213
 第三页 253 130 45
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZJNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZJNewFeatureCellId forIndexPath:indexPath];
    if(indexPath.item == 0){
        cell.backgroundColor = ZJColor(254, 206, 53);
        cell.nameText = @"查看商户详情";
        cell.subText = @"评分,人均,推荐菜,应有尽有!";
        cell.icon = @"guide1";
        [cell hideBtn];
    }else if (indexPath.item == 1){
        cell.backgroundColor = ZJColor(91, 181, 213);
        cell.nameText = @"尽享给力优惠";
        cell.subText = @"团购,订座,优惠券,各种给力!";
        cell.icon = @"guide2";
        [cell hideBtn];
    }else{
        cell.backgroundColor = ZJColor(253, 130, 45);
        cell.nameText = @"吃喝玩乐就用大众点评";
        cell.subText = nil;
        cell.icon = @"03_guide_iPhone";
        [cell showBtn];
    }
    return cell;
}

#pragma mark <UICollectionViewDelegate>
// 监听滚动事件
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetX = self.collectionView.contentOffset.x;
    NSInteger curPage = offsetX / kScreenSize.width + 0.5;
    self.pageControl.currentPage = curPage;
}

@end
