//
//  XMGLoginField.m
//  BuDeJie
//
//  Created by xiaomage on 16/3/16.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "XMGLoginField.h"
#import "UITextField+Placeholder.h"
@implementation XMGLoginField
/*
 1.文本框光标变成白色
 2.文本框开始编辑的时候,占位文字颜色变成白色
 */

- (void)awakeFromNib
{
    // 设置光标的颜色为白色
    self.tintColor = [UIColor whiteColor];
    
    // 监听文本框编辑: 1.代理 2.通知 3.target
    // 原则:不要自己成为自己代理
    // 开始编辑
    [self addTarget:self action:@selector(textBegin) forControlEvents:UIControlEventEditingDidBegin];
    
    // 结束编辑
    [self addTarget:self action:@selector(textEnd) forControlEvents:UIControlEventEditingDidEnd];
    
    // 获取占位文字控件
    self.placeholderColor = [UIColor redColor];
    
    // 快速设置占位文字颜色 => 文本框占位文字可能是label => 验证占位文字是label => 拿到label => 查看label属性名(1.runtime 2.断点)
    // self.placeholderColor = [UIColor redColor];
    
}

// 文本框开始编辑调用
- (void)textBegin
{
    self.placeholderColor = [UIColor whiteColor];
}


// 文本框结束编辑调用
- (void)textEnd
{
    self.placeholderColor = [UIColor redColor];
}

@end
