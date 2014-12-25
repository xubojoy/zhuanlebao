//
//  NextViewController.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-17.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "RecommendViewController.h"
#import "ShareSDKProcessor.h"
#import "ShareContent.h"
@interface RecommendViewController ()

@end

@implementation RecommendViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NTViewController sharedController] hidesTabBar:YES animated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设定位置和大小
    self.title = @"推荐项目";
    CGRect frame = CGRectMake(0,80,[UIScreen mainScreen].bounds.size.width,320);
    // 读取gif图片数据
    NSData *gif = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"play" ofType:@"gif"]];
    // view生成
    UIWebView *webView = [[UIWebView alloc] initWithFrame:frame];
    webView.userInteractionEnabled = NO;//用户不可交互
    webView.backgroundColor = [UIColor clearColor];
    [webView loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView];
    [self initShareBtn];
}

-(void)initShareBtn{
    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake(300, 20, 44, 44);
    shareBtn.backgroundColor = [UIColor purpleColor];
    [shareBtn addTarget:self action:@selector(shareBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [shareBtn setTitle:@"分享" forState:UIControlStateNormal];
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithCustomView:shareBtn];
    shareItem.width = 100;
    self.navigationItem.rightBarButtonItem = shareItem;
}

#pragma mark - -----------------ShareSDK实现分享功能------------------
-(void)shareBtnPress:(id)sender{
    ShareContent *shareContent = [self collectionShareContent];
    ShareSDKProcessor *shareSDKProcessor = [ShareSDKProcessor new];
    [shareSDKProcessor share:shareContent shareViewDelegate:self sender:sender shareSuccessBlock:^{
        
    }];
}

-(ShareContent *) collectionShareContent{
    
    ShareContent *shareContent = [[ShareContent alloc] initWithTitle:nil
                                                             content:nil
                                                    sinaWeiBoContent:nil
                                                                 url:nil
                                                               image:nil
                                                            imageUrl:nil];
    return shareContent;
}

- (void)viewOnWillDisplay:(UIViewController *)viewController shareType:(ShareType)shareType
{
    [ShareSDKProcessor customShareView:viewController];
}


@end
