//
//  TLNavigationController.m
//  Project2
//
//  Created by lanqs on 15/7/14.
//  Copyright (c) 2015年 lanqs. All rights reserved.
//

#import "TLNavigationController.h"

@interface TLNavigationController ()

@end

@implementation TLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}
/**
 *  重写push方法，拦截原来的push进来的控制器
 *
 *  @param viewController 即将push进来的viewController
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    if(self.viewControllers.count > 0){
//     self.navigationItem.leftBarButtonItem =
//    }
    [super pushViewController:viewController animated:animated];
}
@end
