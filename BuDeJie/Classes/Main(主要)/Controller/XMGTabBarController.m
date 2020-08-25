//
//  XMGTabBarController.m
//  BuDeJie
//
//  Created by xiaomage on 16/3/11.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "XMGTabBarController.h"
#import "XMGEssenceViewController.h"
#import "XMGFriendTrendViewController.h"
#import "XMGMeViewController.h"
#import "XMGNewViewController.h"
#import "XMGPublishViewController.h"
#import "UIImage+Image.h"
#import "XMGTabBar.h"
#import "XMGNavigationViewController.h"


@interface XMGTabBarController ()

@end

@implementation XMGTabBarController

// 只会调用一次
+ (void)load
{
    // 获取哪个类中UITabBarItem
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    // 设置按钮选中标题的颜色:富文本:描述一个文字颜色,字体,阴影,空心,图文混排
    // 创建一个描述文本属性的字典
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:attrs forState:UIControlStateSelected];
    
    // 设置字体尺寸:只有设置正常状态下,才会有效果
    NSMutableDictionary *attrsNor = [NSMutableDictionary dictionary];
    attrsNor[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:attrsNor forState:UIControlStateNormal];
}

#pragma mark - 生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    // 1 添加子控制器(5个子控制器) -> 自定义控制器 -> 划分项目文件结构
    [self setupAllChildViewController];
    
    // 2 设置tabBar上按钮内容 -> 由对应的子控制器的tabBarItem属性
    [self setupAllTitleButton];
    
    // 3.自定义tabBar
    [self setupTabBar];
}

#pragma mark - 自定义tabBar
- (void)setupTabBar
{
    XMGTabBar *tabBar = [[XMGTabBar alloc] init];
    
    [self setValue:tabBar forKey:@"tabBar"];
}

#pragma mark - 添加所有子控制器
- (void)setupAllChildViewController
{
    // 精华
    XMGEssenceViewController *essenceVc = [[XMGEssenceViewController alloc] init];
    XMGNavigationViewController *nav = [[XMGNavigationViewController alloc] initWithRootViewController:essenceVc];
    // initWithRootViewController:push
    [self addChildViewController:nav];
    
    // 新帖
    XMGNewViewController *newVc = [[XMGNewViewController alloc] init];
    XMGNavigationViewController *nav1 = [[XMGNavigationViewController alloc] initWithRootViewController:newVc];
    [self addChildViewController:nav1];
    
    // 关注
    XMGFriendTrendViewController *ftVc = [[XMGFriendTrendViewController alloc] init];
    XMGNavigationViewController *nav3 = [[XMGNavigationViewController alloc] initWithRootViewController:ftVc];
    [self addChildViewController:nav3];
    
    // 我
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:NSStringFromClass([XMGMeViewController class]) bundle:nil];
    // 加载箭头指向控制器
    XMGMeViewController *meVc = [storyboard instantiateInitialViewController];
    XMGNavigationViewController *nav4 = [[XMGNavigationViewController alloc] initWithRootViewController:meVc];
    [self addChildViewController:nav4];
}

// 设置tabBar上所有按钮内容
- (void)setupAllTitleButton
{
    // 0:nav
    UINavigationController *nav = self.childViewControllers[0];
    nav.tabBarItem.title = @"精华";
    nav.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    // 快速生成一个没有渲染图片
    nav.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_essence_click_icon"];
    
    // 1:新帖
    UINavigationController *nav1 = self.childViewControllers[1];
    nav1.tabBarItem.title = @"新帖";
    nav1.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    nav1.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_new_click_icon"];
    
    // 3.关注
    UINavigationController *nav3 = self.childViewControllers[2];
    nav3.tabBarItem.title = @"关注";
    nav3.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    nav3.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_friendTrends_click_icon"];
    
    // 4.我
    UINavigationController *nav4 = self.childViewControllers[3];
    nav4.tabBarItem.title = @"我";
    nav4.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    nav4.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_me_click_icon"];
}

@end
