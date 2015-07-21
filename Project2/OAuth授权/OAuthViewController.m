//
//  OAuthViewController.m
//  Project2
//
//  Created by lanqs on 15/7/20.
//  Copyright (c) 2015年 lanqs. All rights reserved.
//

#import "OAuthViewController.h"
#import "LoadNetWork.h"
#import "BlogController.h"
#import "NewFeatureViewController.h"

@interface OAuthViewController ()<UIWebViewDelegate>

@end

@implementation OAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加webView
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    webView.delegate = self;
    [self.view addSubview:webView];
    
    //请求地址：https://api.weibo.com/oauth2/authorize
    //请求参数：client_id	true	string	申请应用时分配的AppKey。830169797
    //redirect_uri	true	string	授权回调地址，站外应用需与设置的回调地址一致，站内应用需填写canvas page的地址。
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=830169797&redirect_uri=http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

#pragma mark - UIWebViewDelegate methods
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *url = request.URL.absoluteString;
    //截取code
    NSRange range = [url rangeOfString:@"code="];
    if (range.length != 0) {
        NSInteger fromIndex = range.location + range.length;
        NSString *code = [url substringFromIndex:fromIndex];
        [self accessTokenWithCode:code];
      //禁止加载回调地址
        return NO;
    }
    return YES;
}

- (void)accessTokenWithCode:(NSString *)code
{
    //配置参数
    NSDictionary *params = [NSDictionary dictionary];
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"client_id"] = @"830169797";
    para[@"client_secret"] = @"22e60764dcd1a932ca1bb7647dc1b90e";
    para[@"grant_type"] = @"authorization_code";
    para[@"redirect_uri"]=@"http://www.baidu.com";
    para[@"code"] = code;
    params = para;
    //网络请求
    [LoadNetWork loadNetWorkWithURL:@"https://api.weibo.com/oauth2/access_token" params:params success:^(id responseObject) {
        //判断版本号
        NSString *key = @"CFBundleVersion";
        //获取上一次登录的版本号
        NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
        //获取当前版本号
        NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
        //版本号相同直接进入blogVc 版本号不同显示新特性并将当前版本号存入沙盒并切换控制器
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        NewFeatureViewController *newFeatureVC = [[NewFeatureViewController alloc] init];
        BlogController *blogVc = [[BlogController alloc] init];
        if ([lastVersion isEqualToString:currentVersion]) {
            window.rootViewController = blogVc;
        }else{
            window.rootViewController = newFeatureVC;
            //将当前版本号存入沙盒
            [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    } failure:^(NSError *error) {
        CusLog(@"%@",error);
    }];
}
@end
