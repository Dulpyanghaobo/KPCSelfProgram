//
//  SEEDTitleCellModel.m
//  Pods-SEEDUIKit_Example
//
//  Created by GanXiaoteng on 2020/3/14.
//

#import "SEEDTitleCellModel.h"

@interface SEEDTitleCellModel ()
@property (nonatomic, strong) NSString *titleString;

@property (nonatomic, assign) UIRectCorner corner;

@property (nonatomic, assign) CGSize cornerRadii;
@end

@implementation SEEDTitleCellModel

- (instancetype)initWithTitle:(NSString *)title corner:(UIRectCorner)corner cornerRadii:(CGSize)cornerRadii block:(void(^)(UILabel *lab))block {
    self = [super init];
    if (self) {
        self.titleString = title;
        self.corner = corner;
        self.cornerRadii = cornerRadii;
        self.labelUIblock = block;
    };
    return self;
}


#pragma mark - SEEDCollectionCellItemProtocol
/// 对应cell的类
-(Class)seed_CellClass {
    return NSClassFromString(@"SEEDTitleCell");
}

@synthesize seed_cellSize;

@synthesize seed_indexPath;

@synthesize seed_refreshCellBlock;

@synthesize seed_didSelectActionBlock;
@end
