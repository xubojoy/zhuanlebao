//
//  NextViewController.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-17.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "InvestmentViewController.h"
#import "InvestmentCell.h"
#import "InvestDetailController.h"

static NSString *identifier = @"cell";
@interface InvestmentViewController ()

@end

@implementation InvestmentViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NTViewController sharedController] hidesTabBar:NO animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"投资项目";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initShareBtn];
    [self initTableView];
}

-(void)initShareBtn{
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(300, 20, 44, 44);
    searchBtn.backgroundColor = [UIColor purpleColor];
    [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(searchBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    shareItem.width = 100;
    self.navigationItem.rightBarButtonItem = shareItem;
}

-(void)searchBtnPress:(id)sender{

}

//初始化tableView
-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WEIGHT, VIEW_HEIGHT-49) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"InvestmentCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:identifier];
    [self.view addSubview:self.tableView];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    InvestmentCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    InvestDetailController *idc = [[InvestDetailController alloc] init];
    [self.navigationController pushViewController:idc animated:YES];
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
