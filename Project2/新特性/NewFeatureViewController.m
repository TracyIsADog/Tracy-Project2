//
//  NewFeatureViewController.m
//  Project2
//
//  Created by lanqs on 15/7/21.
//  Copyright (c) 2015年 lanqs. All rights reserved.
//

#import "NewFeatureViewController.h"
#import "BlogController.h"
#define ViewCenterX self.view.frame.size.width * 0.5
#define ViewHeight self.view.frame.size.height
#define ViewWidth self.view.frame.size.width
#define TLNewFeatureCount 4

@interface NewFeatureViewController ()<UIScrollViewDelegate>
//分页控制器
@property (weak ,nonatomic) UIPageControl *page;
/**
 *  初始化界面
 */
- (void)initializeAppearance;

@end

@implementation NewFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeAppearance];
}

- (void)initializeAppearance
{
    //scrollView上imgView个数
    NSInteger count = TLNewFeatureCount;
    //添加scrollView到View上
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.contentSize = CGSizeMake(count * ViewWidth, 0);
    //去除弹簧效果
    scrollView.bounces = NO;
    //设置代理
    scrollView.delegate = self;
    //取消水平滑动条
    scrollView.showsHorizontalScrollIndicator = NO;
    //设置scrollView的大小
    scrollView.frame = self.view.bounds;
    //打开分页效果
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    //添加imgView 到scrollView上
    for (int i = 0; i < count; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        //设置imgView的大小和位置
        imgView.size = CGSizeMake(ViewWidth, ViewHeight);
        imgView.x = i * ViewWidth;
        imgView.y = 0;
        //设置图片
        NSString *imgName = [NSString stringWithFormat:@"new_feature_%d",i + 1];
        imgView.image = [UIImage imageNamed:imgName];
        //添加imgView到scrollView
        [scrollView addSubview:imgView];
        
        if (i == count - 1) {
            [self setLastImgView:imgView];
        }
    }
    //添加分页控制器
    UIPageControl *page = [[UIPageControl alloc] init];
    //设置分页页数
    page.numberOfPages = count;
    //设置分页选中页的颜色
    page.currentPageIndicatorTintColor = TracyRGBColor(253, 98, 42);
    //设置分页未选中页的颜色
    page.pageIndicatorTintColor = TracyRGBColor(183, 183, 183);
    //设置分页控制器的位置
    page.centerX = ViewWidth * 0.5;
    page.centerY = ViewHeight - 50;
    [self.view addSubview:page];
    self.page = page;
    
}

- (void)setLastImgView:(UIImageView *)imgView
{
    //打开imgView的交互
    imgView.userInteractionEnabled = YES;
    //1.添加分享按钮
    UIButton *shareButton = [[UIButton alloc] init];
    //设置button的尺寸和位置
    shareButton.size = CGSizeMake(200, 30);
    shareButton.centerX = ViewCenterX;
    shareButton.centerY = ViewHeight * 0.7;
    //设置shareBtn图片
    [shareButton setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareButton setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    //设置shareBtnTitleLabel
    [shareButton setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareButton.titleLabel.font = [UIFont systemFontOfSize:15];
    //设置shareBtn内边距
    shareButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    //监听点击事件
    [shareButton addTarget:self action:@selector(shareBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [imgView addSubview:shareButton];
    
    //2.开始微博按钮
    UIButton *startWeibo = [[UIButton alloc] init];
    //设置startWeibo按钮大小和位置
    startWeibo.size = CGSizeMake(200, 50);
    startWeibo.centerX = ViewCenterX;
    startWeibo.centerY = ViewHeight * 0.78;
    //设置startWeibo按钮图片
    [startWeibo setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startWeibo setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    //设置startWeibo按钮titleLabel
    [startWeibo setTitle:@"开始微博" forState:UIControlStateNormal];
    startWeibo.titleLabel.font = [UIFont systemFontOfSize:18];
    //监听点击事件
    [startWeibo addTarget:self action:@selector(startWeiboClick:) forControlEvents:UIControlEventTouchUpInside];
    [imgView addSubview:startWeibo];
}

//shareBtn点击事件
- (void)shareBtnClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
}

//startWeibo点击事件
- (void)startWeiboClick:(UIButton *)sender
{
    //切换控制器
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[BlogController alloc] init];
}

#pragma mark - UIScrollViewDelegate methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat page = scrollView.contentOffset.x / scrollView.width;
    //四舍五入得到page
    self.page.currentPage = (int)(page + 0.5);
}

@end
