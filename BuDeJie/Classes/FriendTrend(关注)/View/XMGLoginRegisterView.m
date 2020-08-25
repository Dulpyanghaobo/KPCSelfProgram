//
//  XMGLoginRegisterView.m
//  BuDeJie
//
//  Created by xiaomage on 16/3/15.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "XMGLoginRegisterView.h"

@interface XMGLoginRegisterView ()
@property (weak, nonatomic) IBOutlet UIButton *loginRegisterButton;
@end

@implementation XMGLoginRegisterView

// 越复杂的界面,封装 有特殊效果界面,也需要封装

+ (instancetype)loginView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

+ (instancetype)registerView
{
     return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)awakeFromNib
{
    UIImage *image = _loginRegisterButton.currentBackgroundImage;
    
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
   // 让按钮背景图片不要被拉伸
    [_loginRegisterButton setBackgroundImage:image forState:UIControlStateNormal];
}

@end
