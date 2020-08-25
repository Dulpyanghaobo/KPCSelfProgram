//
//  XMGFastLoginView.m
//  BuDeJie
//
//  Created by xiaomage on 16/3/15.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "XMGFastLoginView.h"

@implementation XMGFastLoginView
+ (instancetype)fastLoginView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}
@end
