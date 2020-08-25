//
//  SEEDTitleCellModel.h
//  Pods-SEEDUIKit_Example
//
//  Created by GanXiaoteng on 2020/3/14.
//

#import <Foundation/Foundation.h>
#import "SEEDCollectionCellItemProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SEEDTitleCellModel : NSObject<SEEDCollectionCellItemProtocol>

@property (nonatomic, strong, readonly) NSString *titleString;

@property (nonatomic, assign, readonly) UIRectCorner corner;

@property (nonatomic, assign, readonly) CGSize cornerRadii;

@property (nonatomic, copy) void(^labelUIblock)(UILabel *lab);

- (instancetype)initWithTitle:(NSString *)title corner:(UIRectCorner)corner cornerRadii:(CGSize)cornerRadii block:(void(^)(UILabel *lab))block ;

@end

NS_ASSUME_NONNULL_END
