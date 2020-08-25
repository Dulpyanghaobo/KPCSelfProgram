//
//  KPCMyKidTreasureCellModel.m
//  BuDeJie
//
//  Created by yhb on 2020/8/25.
//  Copyright © 2020 小码哥. All rights reserved.
//

#import "KPCMyKidTreasureCellModel.h"
#import "SEEDCollectionVerticalSectionItem.h"

@implementation KPCMyKidTreasureCellModel
- (instancetype)initWithSectionItem:(SEEDCollectionVerticalSectionItem *)sectionItem {
    if (self = [super init]) {
        self.seed_cellSize = CGSizeMake(sectionItem.seed_cellWidth, 48);
    }
    return self;
}
/// 对应cell的类
- (Class )seed_CellClass {
    return NSClassFromString(@"KPCMyKidTreasureCell");
}

@synthesize seed_cellSize;

@synthesize seed_indexPath;

@synthesize seed_refreshCellBlock;

@synthesize seed_didSelectActionBlock;
@end
