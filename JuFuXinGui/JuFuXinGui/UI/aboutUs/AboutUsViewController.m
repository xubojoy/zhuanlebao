//
//  AboutUsViewController.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-17.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "AboutUsViewController.h"
#import "AboutUsCell.h"
static NSString *cellIdentifier = @"cell";
@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于我们";
    self.titleArray = [[NSMutableArray alloc] initWithObjects:@"软件介绍",@"用户协议",@"意见反馈",@"常见问题",@"检查更新", nil];
    [self initTableView];
    [self initBottom];
}

//初始化tableView
-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WEIGHT, VIEW_HEIGHT-49-150) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    UINib *nib = [UINib nibWithNibName:@"AboutUsCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:cellIdentifier];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.view addSubview:self.tableView];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AboutUsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [self.titleArray objectAtIndex:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

//初始化bottom
-(void)initBottom{
    
    UIButton *hotLineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    hotLineBtn.backgroundColor = [UIColor purpleColor];
    hotLineBtn.frame = CGRectMake(100, self.tableView.frame.size.height, VIEW_WEIGHT-2*100, 30);
    [hotLineBtn addTarget:self action:@selector(hotLineBtnClcik:) forControlEvents:UIControlEventTouchUpInside];
    [hotLineBtn setTitle:@"呼叫客服热线" forState:UIControlStateNormal];
    [self.view addSubview:hotLineBtn];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.backgroundColor = [UIColor purpleColor];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnClcik:) forControlEvents:UIControlEventTouchUpInside];
    loginBtn.frame = CGRectMake(100, self.tableView.frame.size.height+60, VIEW_WEIGHT-2*100, 30);
    [self.view addSubview:loginBtn];
}


-(void)hotLineBtnClcik:(UIButton *)sender{


}

-(void)loginBtnClcik:(UIButton *)sender{


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
