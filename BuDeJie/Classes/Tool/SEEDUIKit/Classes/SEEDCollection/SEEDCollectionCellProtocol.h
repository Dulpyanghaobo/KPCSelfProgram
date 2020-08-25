//
//  SEEDCollectionCellProtocol.h
//  1haiiPhone
//
//  Created by GanXiaoteng on 2020/1/15.
//  Copyright © 2020 EHi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEEDCollectionCellItemProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SEEDCollectionCellProtocol <NSObject>

@required
/** 加载数据 */
- (void)seed_cellWithData:(__kindof NSObject<SEEDCollectionCellItemProtocol> *)itemModel;
@end

NS_ASSUME_NONNULL_END
