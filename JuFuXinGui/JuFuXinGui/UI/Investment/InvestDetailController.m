//
//  InvestDetailController.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-19.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "InvestDetailController.h"
#import "ShareSDKProcessor.h"
#import "ShareContent.h"
@interface InvestDetailController ()

@end

@implementation InvestDetailController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NTViewController sharedController] hidesTabBar:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initShareBtn];
}

-(void)initShareBtn{
    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake(300, 20, 44, 44);
    shareBtn.backgroundColor = [UIColor purpleColor];
    [shareBtn setTitle:@"分享" forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(shareBtnPress:) forControlEvents:UIControlEventTouchUpInside];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
