//
//  AboutUsViewController.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-17.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "AboutUsViewController.h"
#import "AboutUsCell.h"
#import "WebViewController.h"
static NSString *cellIdentifier = @"cell";
@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [[NTViewController sharedController] hidesTabBar:NO animated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initHeader];
    [self initTableView];
    [self initBottom];
}

#pragma mark - 头部相关
//初始化头部
- (void)initHeader{
    //初始化布局与背景
    self.header  = [[HeaderView alloc] initWithTitle:@"关于我们" navigationController:self.navigationController];
    self.header.backBut.hidden = YES;
    [self.view addSubview:self.header];
}

//初始化tableView
#pragma mark - UITableView
-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.header.frame.size.height, VIEW_WEIGHT, VIEW_HEIGHT-49-150) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    UINib *nib = [UINib nibWithNibName:@"AboutUsCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:cellIdentifier];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.view addSubview:self.tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return 2;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AboutUsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        cell.textLabel.text = @"软件介绍";
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"用户协议";
            cell.lineView.hidden = YES;
        }else if(indexPath.row == 1){
            cell.textLabel.text = @"意见反馈";
            cell.upLine.frame = CGRectMake(10, 0, VIEW_WEIGHT, 0.5);
        }
    
    }else if (indexPath.section == 2){
        cell.textLabel.text = @"常见问题";
    
    }else if (indexPath.section == 3){
    
        cell.textLabel.text = @"检查更新";
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 20;
    }
    return 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WebViewController *wvc = [[WebViewController alloc] init];
    [self.navigationController pushViewController:wvc animated:YES];

}

//初始化bottom
#pragma mark - 热线和登陆
-(void)initBottom{
    
    UIButton *hotLineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    hotLineBtn.backgroundColor = [UIColor greenColor];
    hotLineBtn.frame = CGRectMake(100, self.tableView.frame.size.height, VIEW_WEIGHT-2*100, 30);
    [hotLineBtn addTarget:self action:@selector(hotLineBtnClcik:) forControlEvents:UIControlEventTouchUpInside];
    [hotLineBtn setTitle:@"呼叫客服热线" forState:UIControlStateNormal];
    CALayer *layer = hotLineBtn.layer;
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:3.0];
    [self.view addSubview:hotLineBtn];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.backgroundColor = [UIColor purpleColor];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnClcik:) forControlEvents:UIControlEventTouchUpInside];
    loginBtn.frame = CGRectMake(100, self.tableView.frame.size.height+60, VIEW_WEIGHT-2*100, 30);
    layer = loginBtn.layer;
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:3.0];
    [self.view addSubview:loginBtn];
}

-(void)hotLineBtnClcik:(UIButton *)sender{
    NSString *hotLine = @"010-888888888";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:hotLine delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [alert show];
}

-(void)loginBtnClcik:(UIButton *)sender{


}

#pragma mark - UIAlertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        NSLog(@">>>>>>确定>>>>>>%ld",buttonIndex);
    }else if (buttonIndex == 1){
        NSLog(@">>>>>>取消>>>>>>%ld",buttonIndex);
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
