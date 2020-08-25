//
//  SEEDSectionTitleItem.m
//  Pods-SEEDUIKit_Example
//
//  Created by GanXiaoteng on 2020/3/14.
//

#import "SEEDSectionTitleItem.h" 

@interface SEEDSectionTitleItem ()
@property (nonatomic, strong) SEEDTitleCellModel *cellModel;
@end

@implementation SEEDSectionTitleItem
- (instancetype)initWithTitle:(NSString *)title corner:(UIRectCorner)corner cornerRadii:(CGSize)cornerRadii block:(void(^)(UILabel *lab))labelUIblock{
    if (self = [super init]) {
        self.seed_sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.seed_horizontalSpacing = 0;
        self.seed_verticalSpacing = 0;
        self.seed_columnCount = 1;
        SEEDTitleCellModel *cellModel = [[SEEDTitleCellModel alloc] initWithTitle:title corner:corner cornerRadii:cornerRadii block:labelUIblock];
        self.cellModel = cellModel;
        [self.seed_cellItems addObject:cellModel];
    }
    return self;
}
 
@end
