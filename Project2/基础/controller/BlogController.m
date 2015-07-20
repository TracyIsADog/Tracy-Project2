//
//  BlogController.m
//  Project2
//
//  Created by lanqs on 15/7/13.
//  Copyright (c) 2015年 lanqs. All rights reserved.
//

#import "BlogController.h"
#import "HomeController.h"
#import "MessageController.h"
#import "DiscoverController.h"
#import "ProfileController.h"
#import "TLNavigationController.h"
#import "TLTabBar.h"

@interface BlogController ()<TLTabBarDelegate>

//初始化界面
- (void)initializeAppearance;
/**
 *  添加子控制器
 *
 *  @param vc          子控制器
 *  @param title       子控制器名称
 *  @param image       子控制器图标图片
 *  @param selectedImg 子控制器选中状态图片
 */
- (void)addChildVcWithVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImg:(NSString *)selectedImg;
@end

@implementation BlogController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeAppearance];
}

- (void)initializeAppearance
{
    //首页
    HomeController *home = [[HomeController alloc]init];
    [self addChildVcWithVC:home title:@"首页" image:@"tabbar_home" selectedImg:@"tabbar_home_selected"];
    //消息
    MessageController *message = [[MessageController alloc]init];
    [self addChildVcWithVC:message title:@"消息" image:@"tabbar_message_center" selectedImg:@"tabbar_message_center_selected"];
    //发现
    DiscoverController *discover = [[DiscoverController alloc]init];
    [self addChildVcWithVC:discover title:@"发现" image:@"tabbar_discover" selectedImg:@"tabbar_discover_selected"];
    //我
    ProfileController *profile = [[ProfileController alloc]init];
    [self addChildVcWithVC:profile title:@"我" image:@"tabbar_profile" selectedImg:@"tabbar_profile_selected"];
    //重新设置tabBar
    TLTabBar *tabBar = [[TLTabBar alloc] init];
    tabBar.delegate = self;
    [self setValue:[[TLTabBar alloc] init] forKeyPath:@"tabBar"];
}

- (void)addChildVcWithVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImg:(NSString *)selectedImg
{
    //设置导航栏以及tabbar文字
    vc.title = title;
    //设置普通状态图片
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //选中状态图片
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //设置普通状态字体属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    [textAttrs setValue:TracyRGBColor(123, 123, 123) forKey:NSForegroundColorAttributeName];
    [vc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    //选中状态字体属性
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    [selectedTextAttrs setValue:[UIColor orangeColor] forKey:NSForegroundColorAttributeName];
    [vc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    //包装导航控制器
    TLNavigationController *nav = [[TLNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
}

#pragma mark - TLTabBarDelegate methods
- (void)tabBarPlusBtnDidClick:(TLTabBar *)tabBar
{
    CusLog(@"afafa");
    
}
@end
