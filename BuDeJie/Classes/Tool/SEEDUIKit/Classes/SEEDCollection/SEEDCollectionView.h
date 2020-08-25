//
//  SEEDCollectionView.h
//  1haiiPhone
//
//  Created by GanXiaoteng on 2020/1/15.
//  Copyright © 2020 EHi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SEEDCollectionViewModelDelegate.h"
#import "SEEDCollectionProxy.h"



@class SEEDCollectionVerticalSectionItem,SEEDCollectionProxy;
NS_ASSUME_NONNULL_BEGIN

@interface SEEDCollectionView : UICollectionView
/// Sections数组
@property (nonatomic, strong, readonly) NSMutableArray <NSObject<SEEDCollectionSectionItemProtocol> *> *items;

///// 代理转接
@property (nonatomic, strong) SEEDCollectionProxy *proxy;

/// 绑定viewModel 
- (void)seed_setViewModel:(__kindof NSObject<SEEDCollectionViewModelDelegate> *)viewModel;

@end

NS_ASSUME_NONNULL_END
