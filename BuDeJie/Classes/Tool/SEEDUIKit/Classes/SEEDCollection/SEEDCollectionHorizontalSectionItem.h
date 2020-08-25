//
//  SEEDCollectionHorizontalSectionItem.h
//  AFNetworking
//
//  Created by GanXiaoteng on 2020/3/19.
//  水平方向 确定行数

#import <Foundation/Foundation.h>
#import "SEEDCollectionSectionItemProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SEEDCollectionHorizontalSectionItem : NSObject<SEEDCollectionSectionItemProtocol,NSCopying,NSMutableCopying>

/**item中cell的宽度*/
@property (nonatomic, assign) CGFloat cell_width;
/// section的行（一列cell个数）
@property (nonatomic, assign) NSInteger seed_lineCount;
@end

NS_ASSUME_NONNULL_END
