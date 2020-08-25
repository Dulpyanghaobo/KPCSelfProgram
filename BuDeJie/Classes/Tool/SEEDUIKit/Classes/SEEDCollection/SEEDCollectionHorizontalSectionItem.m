//
//  SEEDCollectionHorizontalSectionItem.m
//  AFNetworking
//
//  Created by GanXiaoteng on 2020/3/19.
//

#import "SEEDCollectionHorizontalSectionItem.h"
 
@implementation SEEDCollectionHorizontalSectionItem

- (instancetype)init {
    if (self = [super init]) {
        [self setUP];
    }
    return self;
} 

- (id)copyWithZone:(NSZone *)zone {
    SEEDCollectionHorizontalSectionItem *item  = [[SEEDCollectionHorizontalSectionItem alloc] init];
    item.seed_lineCount = self.seed_lineCount;
    item.seed_sectionInset = self.seed_sectionInset;
    item.seed_horizontalSpacing = self.seed_horizontalSpacing;
    item.seed_verticalSpacing = self.seed_verticalSpacing;
    item.seed_sectionBgColor = self.seed_sectionBgColor;
    item.seed_cellItems = self.seed_cellItems.mutableCopy;
    return item;
}
- (id)mutableCopyWithZone:(NSZone *)zone {
    SEEDCollectionHorizontalSectionItem *item  = [[SEEDCollectionHorizontalSectionItem alloc] init];
    item.seed_lineCount = self.seed_lineCount;
    item.seed_sectionInset = self.seed_sectionInset;
    item.seed_horizontalSpacing = self.seed_horizontalSpacing;
    item.seed_verticalSpacing = self.seed_verticalSpacing;
    item.seed_sectionBgColor = self.seed_sectionBgColor;
    item.seed_cellItems = self.seed_cellItems.mutableCopy;
    return item;
}

- (void)setUP {
    /// section的行（一列cell个数）
    self.seed_lineCount = 1;
    
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


@synthesize seed_sectionInset;

@synthesize seed_horizontalSpacing;

@synthesize seed_verticalSpacing;

@synthesize seed_sectionBgColor; 

@synthesize seed_cellItems;

@end

