//
//  ZDYNewsListViewController.m
//  ZDYPersonalReader
//
//  Created by david on 16/1/23.
//  Copyright © 2016年 david. All rights reserved.
//

#import "ZDYNewsListViewController.h"
#import "ZDYNewsViewModel.h"
#import "ZDYNewsListCell.h"

@interface ZDYNewsListViewController ()

@property (nonatomic, strong) NSArray * newsModelArray;

@property (nonatomic, strong) UITableView * tableView;

@end

@implementation ZDYNewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTopBar];
    [self initTableView];
    [self initData];
    [self.topBar setViewInCenterWithTitle:@"新闻"];
}

- (void)initData {
    ZDYNewsViewModel * newsViewModel = [[ZDYNewsViewModel alloc] init];
    [newsViewModel setBlockWithReturnBlock:^(id returnValue) {
        self.newsModelArray = returnValue;
        [self.tableView reloadData];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } WithErrorBlock:^(id errorCode) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } WithFailureBlock:^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
    [newsViewModel fetchNewsList];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)initTableView {
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[ZDYNewsListCell class] forCellReuseIdentifier:@"NewsCell"];
    [self.view addSubview:self.tableView];
    [self.tableView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view).offset(64);
    }];
}

#pragma mark - UITableView DateSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsModelArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZDYNewsListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
//    [[cell.contentView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [cell setNewsModel:[self.newsModelArray objectAtIndex:indexPath.row]];
    
    return cell;
}


@end
