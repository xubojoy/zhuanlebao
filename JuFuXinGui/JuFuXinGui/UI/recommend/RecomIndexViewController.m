//
//  MyNBTabController.m
//  NB2
//
//  Created by kohn on 13-11-16.
//  Copyright (c) 2013年 Kohn. All rights reserved.
//

#import "RecomIndexViewController.h"
#import "RecommendViewController.h"
#import "ShareSDKProcessor.h"
#import "ShareContent.h"
@interface RecomIndexViewController ()

@end

@implementation RecomIndexViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.title = @"推荐项目";
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.mainScorllView.animationTimer resumeTimer];
    [[NTViewController sharedController] hidesTabBar:NO animated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initBtn];
    [self initShareBtn];
    [self initScrollView];
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

-(void)initBtn{

    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(50, 300, 50, 50)];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor purpleColor];
    [button addTarget:self action:@selector(goOtherView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

//初始化自动轮播视图
-(void)initScrollView{
    NSMutableArray *viewsArray = [@[] mutableCopy];
    NSArray *colorArray = @[[UIColor cyanColor],[UIColor blueColor],[UIColor greenColor],[UIColor yellowColor],[UIColor purpleColor]];
    for (int i = 0; i < 5; ++i) {
        UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, VIEW_WEIGHT, 150)];
        tempLabel.text = @"春运票荒！！！";
        tempLabel.textAlignment = NSTextAlignmentCenter;
        tempLabel.backgroundColor = [(UIColor *)[colorArray objectAtIndex:i] colorWithAlphaComponent:0.5];
        [viewsArray addObject:tempLabel];
    }
    self.mainScorllView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WEIGHT, 150) animationDuration:2];
    self.mainScorllView.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0];
    self.mainScorllView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
        return viewsArray[pageIndex];
    };
    self.mainScorllView.totalPagesCount = ^NSInteger(void){
        return 5;
    };
    self.mainScorllView.TapActionBlock = ^(NSInteger pageIndex){
        NSLog(@"点击了第%ld个",pageIndex);
    };
    [self.view addSubview:self.mainScorllView];

}

#pragma mark 点击按钮进入其他界面

- (void)goOtherView:(UIButton *)sender{
    
    RecommendViewController * fifth = [[RecommendViewController alloc]init];
    [self.navigationController pushViewController:fifth animated:YES];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.mainScorllView.animationTimer pauseTimer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
