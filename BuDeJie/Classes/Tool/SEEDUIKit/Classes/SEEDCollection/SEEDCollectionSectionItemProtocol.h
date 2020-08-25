//
//  SEEDCollectionSectionItemProtocol.h
//  AFNetworking
//
//  Created by GanXiaoteng on 2020/3/19.
//

#import <Foundation/Foundation.h>
#import "SEEDCollectionCellItemProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SEEDCollectionSectionItemProtocol <NSObject>
/// section的内边距
@property (nonatomic, assign) UIEdgeInsets seed_sectionInset;
 
/// section的列之间的 水平方向上间距
@property (nonatomic, assign) NSInteger seed_horizontalSpacing;
 
/// 同列之间间距 垂直方向上间距
@property (nonatomic, assign) NSInteger seed_verticalSpacing;

/// section的BgColor
@property (nonatomic, strong) UIColor *seed_sectionBgColor;

/// cell集合
@property (nonatomic, strong, nonnull) NSMutableArray <__kindof NSObject<SEEDCollectionCellItemProtocol> *> *seed_cellItems;
@end

NS_ASSUME_NONNULL_END
