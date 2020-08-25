//
//  SEEDCollectionViewDelegate.h
//  Pods-SEEDkit_Example
//
//  Created by GanXiaoteng on 2020/3/11.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "SEEDCollectionSectionItemProtocol.h"
#import "SEEDCollectionCellItemProtocol.h"
 
NS_ASSUME_NONNULL_BEGIN

@protocol SEEDCollectionViewDelegate <NSObject>
@required

/// 加载数据
- (void)reloadWithData:(NSArray <__kindof NSObject<SEEDCollectionSectionItemProtocol> *> *)itemsan animation:(BOOL)animation;

/// 刷新Sections
- (void)refreshSectionsWithData:(NSArray <__kindof NSObject<SEEDCollectionSectionItemProtocol> *> *)items animation:(BOOL)animation;

/// 刷新cells
- (void)refreshCellWithData:(NSArray <__kindof NSObject<SEEDCollectionCellItemProtocol> *> *)cellItems animation:(BOOL)animation;
 
/// 返回指定indexPath在collectionView中的位置
- (CGRect)collectionCellIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
