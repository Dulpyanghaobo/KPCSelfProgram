//
//  SEEDCollectionHorizontalPagingSectionItem.h
//  AFNetworking
//
//  Created by GanXiaoteng on 2020/3/21.
//

#import <Foundation/Foundation.h>
#import "SEEDCollectionSectionItemProtocol.h"


typedef NS_ENUM(NSInteger, SEEDPagingSectionItemType) {
    SEEDPagingSectionItemType_Left = 0,///从上到下的布局
    SEEDPagingSectionItemType_Top///从左到又的布局
};


NS_ASSUME_NONNULL_BEGIN

@interface SEEDCollectionHorizontalPagingSectionItem : NSObject<SEEDCollectionSectionItemProtocol,NSCopying,NSMutableCopying>


/// 行数
@property (nonatomic, assign) NSInteger seed_lineCount;

/// 列数
@property (nonatomic, assign) NSInteger seed_columnCount;

/// 布局方式
@property (nonatomic, assign) SEEDPagingSectionItemType seed_sectionItemType;
@end

NS_ASSUME_NONNULL_END
