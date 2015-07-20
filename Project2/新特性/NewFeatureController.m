//
//  NewFeatureController.m
//  Project2
//
//  Created by lanqs on 15/7/20.
//  Copyright (c) 2015年 lanqs. All rights reserved.
//

#import "NewFeatureController.h"

@interface NewFeatureController ()

- (void)initializeAppearance;

@end

@implementation NewFeatureController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeAppearance];
}

- (void)initializeAppearance
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:scrollView];
    for (int i = 0; i < 4; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        NSString *imgName = [NSString stringWithFormat:@"new_feature_%d",i];
        imgView.image = [UIImage imageNamed:imgName];
        
        [scrollView addSubview:imgView];
    }
}

@end
