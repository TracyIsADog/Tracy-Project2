//
//  TLTabBar.m
//  Project2
//
//  Created by lanqs on 15/7/15.
//  Copyright (c) 2015年 lanqs. All rights reserved.
//

#import "TLTabBar.h"

@interface TLTabBar ()

@property (weak ,nonatomic) UIButton *plusBtn;

@end

@implementation TLTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //添加中间添加按钮
        UIButton *plusBtn = [[UIButton alloc]init];
        //设置背景图片
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        //设置图片
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        //监听点击事件
        [plusBtn addTarget:self action:@selector(plusBtnClick) forControlEvents:UIControlEventTouchUpInside];
        //设置btn大小
        plusBtn.size = plusBtn.currentBackgroundImage.size;
        [self addSubview:plusBtn];
        
        self.plusBtn = plusBtn;
    }
    return self;
}

//重新设置tabBarBtn的位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    //设置plusBtn的位置
    self.plusBtn.centerX = self.width * 0.5;
    self.plusBtn.centerY = self.height * 0.5;
    
    //tabBarBtn的宽度
    CGFloat tabBarBtnW = self.width / 5;
    //默认tabBarBtn的X值
    NSInteger count = self.subviews.count;
    int indexCount = 0;
    for (int i = 0; i < count; i++) {
        UIView *child = self.subviews[i];
        //获得字符串描述的class
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            child.width = tabBarBtnW;
            child.x = indexCount * tabBarBtnW;
            indexCount ++;
            if (indexCount == 2) {
                indexCount ++;
            }
        }
    }
}

- (void)plusBtnClick
{
    if ([self.delegate respondsToSelector:@selector(tabBarPlusBtnDidClick:)]) {
        [self.delegate tabBarPlusBtnDidClick:self];
    }
}
@end
