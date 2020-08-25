//
//  XMGNewViewController.m
//  BuDeJie
//
//  Created by xiaomage on 16/3/11.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "XMGNewViewController.h"
#import "XMGSubTagViewController.h"

@interface XMGNewViewController ()

@end

@implementation XMGNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor brownColor];
    
    [self setupNavBar];
}

#pragma mark - 设置导航条
- (void)setupNavBar
{
    
    // 左边按钮
    // 把UIButton包装成UIBarButtonItem.就导致按钮点击区域扩大
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithimage:[UIImage imageNamed:@"MainTagSubIcon"] highImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(tagClick)];
    
    // titleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
}

#pragma mark - 点击订阅标签调用
- (void)tagClick
{
    // 进入推荐标签界面
    XMGSubTagViewController *subTag = [[XMGSubTagViewController alloc] init];
    
    [self.navigationController pushViewController:subTag animated:YES];
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
