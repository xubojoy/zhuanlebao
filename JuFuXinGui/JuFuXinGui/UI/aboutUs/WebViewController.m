//
//  WebViewController.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-25.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NTViewController sharedController] hidesTabBar:YES animated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setRightSwipeGesture];
    [self initHeader];
}

#pragma mark - 头部相关
//初始化头部
- (void)initHeader{
    //初始化布局与背景
    self.header  = [[HeaderView alloc] initWithTitle:@"关于我们" navigationController:self.navigationController];
    [self.view addSubview:self.header];
}
@end
