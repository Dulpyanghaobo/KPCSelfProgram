//
//  SEEDCollectionVerticalSectionItem.m
//  AFNetworking
//
//  Created by GanXiaoteng on 2020/3/19.
//

#import "SEEDCollectionVerticalSectionItem.h"

@interface SEEDCollectionVerticalSectionItem ()
/// cell 宽度
@property (nonatomic, assign) CGFloat seed_cellWidth;
@end

@implementation SEEDCollectionVerticalSectionItem

- (instancetype)init {
    if (self = [super init]) {
        [self setUP];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    SEEDCollectionVerticalSectionItem *item  = [[SEEDCollectionVerticalSectionItem alloc] init];
    item.seed_columnCount = self.seed_columnCount;
    item.seed_sectionInset = self.seed_sectionInset;
    item.seed_horizontalSpacing = self.seed_horizontalSpacing;
    item.seed_verticalSpacing = self.seed_verticalSpacing;
    item.seed_sectionBgColor = self.seed_sectionBgColor;
    item.seed_cellWidth = self.seed_cellWidth;
    item.seed_cellItems = self.seed_cellItems.mutableCopy;
    return item;
    
}
- (id)mutableCopyWithZone:(NSZone *)zone {
    SEEDCollectionVerticalSectionItem *item  = [[SEEDCollectionVerticalSectionItem alloc] init];
    item.seed_columnCount = self.seed_columnCount;
    item.seed_sectionInset = self.seed_sectionInset;
    item.seed_horizontalSpacing = self.seed_horizontalSpacing;
    item.seed_verticalSpacing = self.seed_verticalSpacing;
    item.seed_sectionBgColor = self.seed_sectionBgColor;
    item.seed_cellWidth = self.seed_cellWidth;
    item.seed_cellItems = self.seed_cellItems.mutableCopy;
    item.seed_cellItems = item.seed_cellItems.mutableCopy;;
    return item;
}

- (void)setUP {
    /// section的行（一列cell个数）
    self.seed_columnCount = 1;
    
    /// section的内边距
    self.seed_sectionInset = UIEdgeInsetsZero;
    
    /// section的列之间的间距
    self.seed_horizontalSpacing = 0;
    
    /// 同列之间间距 垂直方向
    self.seed_verticalSpacing = 0;
    
    /// section的BgColor
    self.seed_sectionBgColor = [UIColor whiteColor];
    
    /// cell集合
    self.seed_cellItems = [NSMutableArray array];;
}


- (CGFloat)seed_cellWidth {
    if (!_seed_cellWidth) {
        _seed_cellWidth = (([[UIScreen mainScreen] bounds].size.width-self.seed_sectionInset.left-self.seed_sectionInset.right)-self.seed_horizontalSpacing*(self.seed_columnCount -1)) / self.seed_columnCount;
    }
    return _seed_cellWidth;
}


@synthesize seed_sectionInset;

@synthesize seed_horizontalSpacing;

@synthesize seed_verticalSpacing;

@synthesize seed_sectionBgColor;

@synthesize seed_cellItems;

@end
