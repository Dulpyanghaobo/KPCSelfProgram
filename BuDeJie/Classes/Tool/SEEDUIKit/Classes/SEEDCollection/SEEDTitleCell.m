//
//  SEEDTitleCell.m
//  Pods-SEEDUIKit_Example
//
//  Created by GanXiaoteng on 2020/3/14.
//

#import "SEEDTitleCell.h"
#import "SEEDTitleCellModel.h"

@interface SEEDTitleCell()
@property (nonatomic, strong) SEEDTitleCellModel *cellModel;
@property (nonatomic, strong) UILabel *titleLable;
@end

@implementation SEEDTitleCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
       [self addSubview:self.titleLable];
    }
    return self;
}
 
- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLable.frame = self.contentView.bounds;
    if (self.cellModel.corner != 0) {
        UIBezierPath *superPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:self.cellModel.corner cornerRadii:self.cellModel.cornerRadii];
        CAShapeLayer *mainLayer = [[CAShapeLayer alloc] init];
        mainLayer.frame = self.bounds;
        mainLayer.path = superPath.CGPath;
        self.layer.mask = mainLayer;
    }
}

- (void)seed_cellWithData:(SEEDTitleCellModel *)itemModel {
    _cellModel = itemModel;
    [self.titleLable setText:itemModel.titleString];
    if (itemModel.labelUIblock) {
        itemModel.labelUIblock(self.titleLable);
    }
}

- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
    }
    return _titleLable;
}
@end
