//
//  KPCMyKidTreasureCell.m
//  BuDeJie
//
//  Created by yhb on 2020/8/25.
//  Copyright © 2020 小码哥. All rights reserved.
//

#import "KPCMyKidTreasureCell.h"
#import "KPCMyKidTreasureCellModel.h"
#import "Masonry.h"
@interface KPCMyKidTreasureCell()

@property (strong, nonatomic) UIView *textContentView;

@property (nonatomic,strong) UILabel *title;

@property (nonatomic,strong) UIImageView *leftIconView;

@property (nonatomic,strong) UIButton *rightButton;
/** 下划线*/
@property (nonatomic,strong) UIView *topStepView;

@property (nonatomic,strong) UIButton *tipsButton;

@end


@implementation KPCMyKidTreasureCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self p_setUpUI];
    }
    return self;
}
- (void)p_setUpUI {
    [self.contentView addSubview:self.textContentView];
    [self.textContentView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    [self.textContentView addSubview:self.leftIconView];
    [self.leftIconView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_offset(12);
        make.centerY.equalTo(self.textContentView);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [self.textContentView addSubview:self.title];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.leftIconView.mas_right).mas_offset(12);
        make.centerY.equalTo(self.textContentView);
    }];
    [self.textContentView addSubview:self.topStepView];
    [self.topStepView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_offset(12);
        make.right.mas_offset(-12);
        make.height.mas_equalTo(1);
        make.bottom.mas_offset(0);
    }];
    [self.textContentView addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.mas_offset(-12);
        make.centerY.equalTo(self.textContentView);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [self.textContentView addSubview:self.tipsButton];
    [self.tipsButton mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.rightButton).mas_offset(-5);
        make.centerY.equalTo(self.textContentView);
    }];
}
- (void)seed_cellWithData:(KPCMyKidTreasureCellModel *)itemModel {
    
}
#pragma mark - getter

@end
