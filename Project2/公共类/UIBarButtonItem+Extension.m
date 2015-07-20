//
//  UIBarButtonItem+Extension.m
//  Project2
//
//  Created by lanqs on 15/7/14.
//  Copyright (c) 2015年 lanqs. All rights reserved.
//


@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highlightImage:(NSString *)highlightImage
{
    //添加按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    //设置按钮尺寸
    btn.size = btn.currentBackgroundImage.size;
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}


@end
