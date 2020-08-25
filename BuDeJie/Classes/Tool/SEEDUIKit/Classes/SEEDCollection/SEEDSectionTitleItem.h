//
//  SEEDSectionTitleItem.h
//  Pods-SEEDUIKit_Example
//
//  Created by GanXiaoteng on 2020/3/14.
//

#import "SEEDCollectionVerticalSectionItem.h"
#import "SEEDTitleCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SEEDSectionTitleItem : SEEDCollectionVerticalSectionItem

@property (nonatomic, strong, readonly) SEEDTitleCellModel *cellModel;

- (instancetype)initWithTitle:(NSString *)title corner:(UIRectCorner)corner cornerRadii:(CGSize)cornerRadii block:(void(^)(UILabel *lab))labelUIblock;
@end

NS_ASSUME_NONNULL_END
