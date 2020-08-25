//
//  KPCMyKidTreasureCellModel.h
//  BuDeJie
//
//  Created by yhb on 2020/8/25.
//  Copyright © 2020 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEEDCollectionCellItemProtocol.h"

NS_ASSUME_NONNULL_BEGIN
@class SEEDCollectionVerticalSectionItem;
@interface KPCMyKidTreasureCellModel : NSObject<SEEDCollectionCellItemProtocol>
- (instancetype)initWithSectionItem:(SEEDCollectionVerticalSectionItem *)sectionItem ;
@end

NS_ASSUME_NONNULL_END
