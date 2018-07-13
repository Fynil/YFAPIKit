//
//  YFSharingDataListVC.m
//  YFAPIKit
//
//  Created by Fynil on 2017/11/2.
//  Copyright © 2017年 Fynil. All rights reserved.
//

#import "YFSharingDataListVC.h"
#import "YFSharingDataVC.h"
static NSString *shareingDataText = @"请配置shareing_data";
static NSString *arrayKey = @"llShareingDatas";

@interface YFSharingDataListVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *sdTableView;
@property (nonatomic, strong) NSMutableArray *shareingDatas;

@end

@implementation YFSharingDataListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"分账信息";
    [self.view addSubview:self.sdTableView];
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addSharingData)];
    self.navigationItem.rightBarButtonItem = addItem;
}

- (void)viewWillDisappear:(BOOL)animated {
    [[NSUserDefaults standardUserDefaults] setObject:self.shareingDatas forKey:arrayKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [super viewWillDisappear:animated];
    NSString *string = [self.shareingDatas componentsJoinedByString:@"|"];
    self.exitParam(@{@"shareing_data":[self.shareingDatas containsObject:shareingDataText]?@"":string});
}

#pragma mark - delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.shareingDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [self.shareingDatas objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.numberOfLines = 0;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YFSharingDataVC *sharingDataVC = [YFSharingDataVC new];
    
    sharingDataVC.exitParam = ^(NSDictionary *exitParam) {
        [self.shareingDatas replaceObjectAtIndex:indexPath.row withObject:exitParam[@"shareing_data"]];
        [tableView reloadData];
    };
    [self.navigationController pushViewController:sharingDataVC animated:YES];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        [self.shareingDatas insertObject:@"" atIndex:indexPath.row];
    } else if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.shareingDatas removeObjectAtIndex:indexPath.row];
    }
    [tableView reloadData];
}

#pragma mark - event

- (void)addSharingData {
    [self.shareingDatas addObject:shareingDataText];
    [self.sdTableView reloadData];

}

#pragma mark - getter

- (UITableView *)sdTableView {
    if (!_sdTableView) {
        _sdTableView = [[UITableView alloc] initWithFrame:self.tableView.frame style:UITableViewStylePlain];
        _sdTableView.tableFooterView = [UIView new];
        _sdTableView.backgroundColor = [UIColor whiteColor];
        _sdTableView.delegate = self;
        _sdTableView.dataSource = self;
    }
    return _sdTableView;
}

- (NSMutableArray *)shareingDatas {
    if (!_shareingDatas) {
        NSMutableArray *cachedData = [[NSUserDefaults standardUserDefaults] objectForKey:arrayKey];
        if (cachedData.count > 0) {
            _shareingDatas = [NSMutableArray arrayWithArray:[cachedData copy]];
        } else {
            _shareingDatas = [NSMutableArray array];
            [_shareingDatas addObject:shareingDataText];
        }
    }
    return _shareingDatas;
}
@end
