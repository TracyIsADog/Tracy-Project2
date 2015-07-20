//
//  TLTabBar.h
//  Project2
//
//  Created by lanqs on 15/7/15.
//  Copyright (c) 2015年 lanqs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TLTabBar;

@protocol TLTabBarDelegate <NSObject,UITabBarDelegate>
@optional
/**
 *  tabBarPlus点击
 *
 *  @param tabBar 被点击的tabBar
 */
- (void)tabBarPlusBtnDidClick:(TLTabBar *)tabBar;
@end

@interface TLTabBar : UITabBar

@property (weak ,nonatomic) id<TLTabBarDelegate> delegate;

@end
