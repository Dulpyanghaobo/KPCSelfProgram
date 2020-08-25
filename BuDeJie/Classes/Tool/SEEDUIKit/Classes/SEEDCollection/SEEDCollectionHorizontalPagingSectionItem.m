//
//  SEEDCollectionHorizontalPagingSectionItem.m
//  AFNetworking
//
//  Created by GanXiaoteng on 2020/3/21.
//

#import "SEEDCollectionHorizontalPagingSectionItem.h"   

@implementation SEEDCollectionHorizontalPagingSectionItem

- (instancetype)init {
    if (self = [super init]) {
        [self setUP];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    SEEDCollectionHorizontalPagingSectionItem *item  = [[SEEDCollectionHorizontalPagingSectionItem alloc] init];
    item.seed_lineCount = self.seed_lineCount;
    item.seed_columnCount = self.seed_columnCount;
    item.seed_sectionInset = self.seed_sectionInset;
    item.seed_horizontalSpacing = self.seed_horizontalSpacing;
    item.seed_verticalSpacing = self.seed_verticalSpacing;
    item.seed_sectionBgColor = self.seed_sectionBgColor;
    item.seed_cellItems = self.seed_cellItems.mutableCopy;
    return item;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    SEEDCollectionHorizontalPagingSectionItem *item  = [[SEEDCollectionHorizontalPagingSectionItem alloc] init];
    item.seed_lineCount = self.seed_lineCount;
    item.seed_columnCount = self.seed_columnCount;
    item.seed_sectionInset = self.seed_sectionInset;
    item.seed_horizontalSpacing = self.seed_horizontalSpacing;
    item.seed_verticalSpacing = self.seed_verticalSpacing;
    item.seed_sectionBgColor = self.seed_sectionBgColor;
    item.seed_cellItems = self.seed_cellItems.mutableCopy;
    return item;
}

- (void)setUP {
    // 行数
    self.seed_lineCount = 1;
    // 列数
    self.seed_columnCount = 1;
    // 内边距
    self.seed_sectionInset = UIEdgeInsetsZero;
    // 列之间的间距
    self.seed_horizontalSpacing = 0;
    // 垂直方向间距
    self.seed_verticalSpacing = 0;
    // Color
    self.seed_sectionBgColor = [UIColor whiteColor]; 
    // 布局方式
    self.seed_sectionItemType = SEEDPagingSectionItemType_Left;
    // cell集合
    self.seed_cellItems = [NSMutableArray array];;
}


@synthesize seed_sectionInset;

@synthesize seed_horizontalSpacing;

@synthesize seed_verticalSpacing;

@synthesize seed_sectionBgColor;

@synthesize seed_cellItems;

@end
