//
//  TLSearchBar.m
//  Project2
//
//  Created by lanqs on 15/7/14.
//  Copyright (c) 2015年 lanqs. All rights reserved.
//

#import "TLSearchBar.h"

@implementation TLSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
   self = [super initWithFrame:frame];
    if (self) {
        //设置显示文字
        self.placeholder = @"请输入搜索信息";
        
        //添加左侧放大镜
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.width = 30;
        imageView.height = 30;
        imageView.contentMode = UIViewContentModeCenter;
        imageView.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        self.leftView = imageView;
        self.leftViewMode = UITextFieldViewModeAlways;

        //设置searchBar背景图片
        [self setBackground:[UIImage imageNamed:@"searchbar_textfield_background"]];
            }
    return self;
}

+ (instancetype)searchBar
{
    return [[self alloc] init];
}
@end
