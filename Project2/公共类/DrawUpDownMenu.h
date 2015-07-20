//
//  DrawUpDownMenu.h
//  Project2
//
//  Created by lanqs on 15/7/15.
//  Copyright (c) 2015年 lanqs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DrawUpDownMenuDelegate <NSObject>
@optional
//监听调用dismiss方法的时候
- (void)dismissDidClick;
@end

@interface DrawUpDownMenu : UIView

/**
 *  创建下拉菜单
 */
+ (instancetype)menu;

/**
 *  显示
 */
- (void)showFrom:(UIView *)from;

/**
 *  销毁
 */
- (void)dismiss;

@property (weak ,nonatomic) id<DrawUpDownMenuDelegate> delegate;
//下拉菜单内容（只需要设置内容高度）
@property (strong ,nonatomic) UIView *content;

@end
