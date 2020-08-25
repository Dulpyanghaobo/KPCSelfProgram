//
//  SEEDCollectionCellItemProtocol.h
//  1haiiPhone
//
//  Created by GanXiaoteng on 2020/1/15.
//  Copyright © 2020 EHi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SEEDCollectionCellItemProtocol <NSObject>

@required
/// 需要自己计算的cellSize
@property (nonatomic, assign) CGSize seed_cellSize;

///  在SEEDCollectionViewLayout计算得到
@property (nonatomic, strong) NSIndexPath *seed_indexPath;

///  刷新cell的回调
@property(nonatomic, copy) void (^seed_refreshCellBlock)(__kindof NSObject<SEEDCollectionCellItemProtocol> *object);
  
///  点击原点击cell的回调
@property(nonatomic, copy) void (^seed_didSelectActionBlock)(__kindof NSObject<SEEDCollectionCellItemProtocol> *object);
 
/// 对应cell的类
- (Class)seed_CellClass;
 
@optional
  
/// 设置圆弧度
/// @param corners 弧度的位置
/// @param radius 度数
- (void)setCcorners:(UIRectCorner)corners withRadius:(NSInteger)radius ;
@end

NS_ASSUME_NONNULL_END
