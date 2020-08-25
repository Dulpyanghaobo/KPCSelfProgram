//
//  XMGSettingViewController.m
//  BuDeJie
//
//  Created by xiaomage on 16/3/12.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "XMGSettingViewController.h"
#import <SDImageCache.h>
#import "XMGFileTool.h"
#import <SVProgressHUD/SVProgressHUD.h>
#define CachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

@interface XMGSettingViewController ()
@property (nonatomic, assign) NSInteger totalSize;
@end

@implementation XMGSettingViewController

static NSString * const ID = @"cell";

- (void)viewDidLoad {
    
    [super viewDidLoad];
  
    // 设置导航条左边按钮
    self.title = @"设置";
    
    // 设置右边
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"jump" style:0 target:self action:@selector(jump)];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    [SVProgressHUD showWithStatus:@"正在计算缓存尺寸...."];
    
    // 获取文件夹尺寸
    // 文件夹非常小,如果我的文件非常大
    [XMGFileTool getFileSize:CachePath completion:^(NSInteger totalSize) {
        
        _totalSize = totalSize;
        
        [self.tableView reloadData];
        
        [SVProgressHUD dismiss];
    }];
}

- (void)jump
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 计算缓存数据,计算整个应用程序缓存数据 => 沙盒(Cache) => 获取cache文件夹尺寸
    
    // 获取缓存尺寸字符串
    cell.textLabel.text = [self sizeStr];
    
    return cell;
}

// 点击cell就会调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 清空缓存
    // 删除文件夹里面所有文件
    [XMGFileTool removeDirectoryPath:CachePath];
    
    _totalSize = 0;
    
    [self.tableView reloadData];
}

 // 获取缓存尺寸字符串
- (NSString *)sizeStr
{
    NSInteger totalSize = _totalSize;
    NSString *sizeStr = @"清除缓存";
    // MB KB B
    if (totalSize > 1000 * 1000) {
        // MB
        CGFloat sizeF = totalSize / 1000.0 / 1000.0;
        sizeStr = [NSString stringWithFormat:@"%@(%.1fMB)",sizeStr,sizeF];
    } else if (totalSize > 1000) {
        // KB
        CGFloat sizeF = totalSize / 1000.0;
        sizeStr = [NSString stringWithFormat:@"%@(%.1fKB)",sizeStr,sizeF];
    } else if (totalSize > 0) {
        // B
        sizeStr = [NSString stringWithFormat:@"%@(%.ldB)",sizeStr,totalSize];
    }

    return sizeStr;
}

@end
