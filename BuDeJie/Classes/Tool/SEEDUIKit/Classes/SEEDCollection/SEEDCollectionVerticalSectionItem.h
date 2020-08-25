//
//  SEEDCollectionVerticalSectionItem.h
//  AFNetworking
//
//  Created by GanXiaoteng on 2020/3/19.
//

#import <Foundation/Foundation.h>
#import "SEEDCollectionSectionItemProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SEEDCollectionVerticalSectionItem : NSObject<SEEDCollectionSectionItemProtocol,NSCopying,NSMutableCopying>

/// section的列数（一行cell个数）
@property (nonatomic, assign) NSInteger seed_columnCount;
 
/// cell 宽度
@property (nonatomic, assign, readonly) CGFloat seed_cellWidth;
@end

NS_ASSUME_NONNULL_END
