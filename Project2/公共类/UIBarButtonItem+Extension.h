//
//  UIBarButtonItem+Extension.h
//  Project2
//
//  Created by lanqs on 15/7/14.
//  Copyright (c) 2015年 lanqs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
/**
 *  添加barButtonItem
 *
 *  @param target         执行方法的对象
 *  @param action         对象执行的方法
 *  @param image          普通状态下item的图片
 *  @param highlightImage 高亮状态下item的图片
 *
 *  @return 返回一个barButtonItem
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highlightImage:(NSString *)highlightImage;

@end
