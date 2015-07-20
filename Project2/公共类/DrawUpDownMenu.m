//
//  DrawUpDownMenu.m
//  Project2
//
//  Created by lanqs on 15/7/15.
//  Copyright (c) 2015年 lanqs. All rights reserved.
//

#import "DrawUpDownMenu.h"

@interface DrawUpDownMenu()

@property (weak ,nonatomic) UIImageView *containerView;

@end

@implementation DrawUpDownMenu

- (UIImageView *)containerView{
    if (!_containerView) {
        UIImageView *containerView = [[UIImageView alloc] init];
        containerView.image = [UIImage imageNamed:@"popover_background"];
        containerView.width = 217;
        containerView.height = 217;
        containerView.userInteractionEnabled = YES;
        [self addSubview:containerView];
        _containerView = containerView;
    }
    return _containerView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

        self.backgroundColor = [UIColor clearColor];
    
    }
    return self;
}

//创建
+ (instancetype)menu
{
    return [[self alloc] init];
}

//显示
- (void)showFrom:(UIView *)from
{
    //1.添加一个蒙板
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    self.frame = window.bounds;
    [window addSubview:self];
    
    //更改坐标系
    CGRect newRect = [from convertRect:from.bounds toView:window];
    //设置containerView的位置
    self.containerView.centerX = CGRectGetMidX(newRect);
    self.containerView.y = CGRectGetMaxY(newRect);
}

//销毁
- (void)dismiss
{
    [self removeFromSuperview];
}
//添加内容
- (void)setContent:(UIView *)content
{
    _content = content;
    
    //设置content的位置
    self.content.x = 10;
    self.content.y = 15;
    
    //2.设置containerView的尺寸
    self.containerView.height = _content.height + 25;
    
    //3.设置content的宽度
    _content.width = self.containerView.width - 2 * _content.x;
    
    [self.containerView addSubview:content];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
    
    if ([self.delegate respondsToSelector:@selector(dismissDidClick)]) {
        [self.delegate dismissDidClick];
    }
}
@end
