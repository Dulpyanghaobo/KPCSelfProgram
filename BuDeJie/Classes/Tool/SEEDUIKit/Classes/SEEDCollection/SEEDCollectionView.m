//
//  SEEDCollectionView.m
//  1haiiPhone
//
//  Created by GanXiaoteng on 2020/1/15.
//  Copyright © 2020 EHi. All rights reserved.
//

#import "SEEDCollectionView.h"
#import "SEEDCollectionVerticalLayout.h"
#import "SEEDCollectionVerticalSectionItem.h"
#import "SEEDCollectionCellProtocol.h"
#import "SEEDCollectionViewDelegate.h"
#import "SEEDEmptyCell.h"


@interface SEEDCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource,SEEDCollectionViewDelegate>

@property (nonatomic, strong) NSMutableSet *reuseIdentifierSet;

@property (nonatomic, strong) __kindof NSObject<SEEDCollectionViewModelDelegate> * collectionViewModel;

/// Sections数组
@property (nonatomic, strong) NSMutableArray <NSObject<SEEDCollectionSectionItemProtocol> *> *items;

@end

@implementation SEEDCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    layout = layout == nil ?[[SEEDCollectionVerticalLayout alloc] init]: layout;
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.proxy.impDelegate = self;
        self.delegate = (id<UICollectionViewDelegate>)self.proxy;
        self.dataSource = (id<UICollectionViewDataSource>)self.proxy;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        Class cellClass =  [SEEDEmptyCell class];
        [self registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
    }
    return self;
}


/// 绑定viewModel
- (void)seed_setViewModel:(__kindof NSObject<SEEDCollectionViewModelDelegate> *)viewModel {
    _collectionViewModel = viewModel;
    _collectionViewModel.seed_collectionViewDelegate = self;
}


#pragma mark SEEDCollectionViewDelegate 
/// 加载数据
- (void)reloadWithData:(NSMutableArray<SEEDCollectionVerticalSectionItem *> *)items animation:(BOOL)animation {
    self.items = items;
    [CATransaction begin];
    [CATransaction setDisableActions:!animation];
    [self reloadData]; 
    [CATransaction commit];
}

/// 刷新Sections
- (void)refreshSectionsWithData:(NSArray<SEEDCollectionVerticalSectionItem *> *)items animation:(BOOL)animation {
    NSMutableArray<NSIndexPath *> *array = [NSMutableArray array];
    for (SEEDCollectionVerticalSectionItem *item in items) {
        for (NSObject<SEEDCollectionCellItemProtocol> *object in item.seed_cellItems) {
            if (object.seed_indexPath != nil) {
                [array addObject:object.seed_indexPath];
            } 
        }
    }
    
    [CATransaction begin];
    [CATransaction setDisableActions:!animation];
    [self reloadItemsAtIndexPaths:array];
    [CATransaction commit];
}

/// 刷新cells
- (void)refreshCellWithData:(NSArray <__kindof NSObject<SEEDCollectionCellItemProtocol> *> *)seed_cellItems animation:(BOOL)animation {
    NSMutableArray<NSIndexPath *> *array = [NSMutableArray array];
    for (__kindof NSObject<SEEDCollectionCellItemProtocol> *object in seed_cellItems) {
        [array addObject:object.seed_indexPath];
    }
    [CATransaction begin];
    [CATransaction setDisableActions:!animation];
    [self reloadItemsAtIndexPaths:array];
    [CATransaction commit];
}

/// 返回指定indexPath在collectionView中的位置
- (CGRect)collectionCellIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes * att = [self layoutAttributesForItemAtIndexPath:indexPath];
    CGRect cellRect = att.frame;
    return cellRect;
}


#pragma mark UICollectionViewDelegate & UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    SEEDCollectionVerticalSectionItem *sectionItem = self.items[section];
    return sectionItem.seed_cellItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SEEDCollectionVerticalSectionItem *sectionItem = self.items[indexPath.section];
    __kindof NSObject<SEEDCollectionCellItemProtocol> *cellItem = sectionItem.seed_cellItems[indexPath.row];
    Class cellClass = cellItem.seed_CellClass;
    NSString *identifier = NSStringFromClass(cellClass);
    if ([cellClass isSubclassOfClass:[UICollectionViewCell class]] && identifier.length > 0) {
        if (![self.reuseIdentifierSet containsObject:cellClass]) {
               NSString *path = [[NSBundle mainBundle] pathForResource:identifier ofType:@"nib"];
               if (path) {
                   UINib *nib = [UINib nibWithNibName:identifier bundle:nil] ;
                   [self registerNib:nib forCellWithReuseIdentifier:identifier];
               } else {
                   [self registerClass:cellClass forCellWithReuseIdentifier:identifier];
               }
               [self.reuseIdentifierSet addObject:cellClass];
           }
           UICollectionViewCell <SEEDCollectionCellProtocol> *cell = [self dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
           if ([cell respondsToSelector:@selector(seed_cellWithData:)]) {
               [cell seed_cellWithData:cellItem];
           }
           return cell;
    }else {
        UICollectionViewCell <SEEDCollectionCellProtocol> *cell = [self dequeueReusableCellWithReuseIdentifier:@"SEEDEmptyCell" forIndexPath:indexPath];
        return cell;
    }
     
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.items.count;
}
  
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray <SEEDCollectionVerticalSectionItem *> *items = self.items;
    SEEDCollectionVerticalSectionItem *sectionItem = [items objectAtIndex:indexPath.section];
    NSMutableArray <__kindof NSObject<SEEDCollectionCellItemProtocol> *> *seed_cellItems =  sectionItem.seed_cellItems;
    __kindof NSObject<SEEDCollectionCellItemProtocol> *object = [seed_cellItems objectAtIndex:indexPath.row];
    if (object.seed_didSelectActionBlock) {
        object.seed_didSelectActionBlock(object);
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

#pragma mark set & get
- (SEEDCollectionProxy *)proxy {
    if(!_proxy){
        _proxy = [SEEDCollectionProxy alloc];
    }
    return _proxy;
}

- (NSMutableSet *)reuseIdentifierSet {
    if (!_reuseIdentifierSet) {
        _reuseIdentifierSet = [NSMutableSet set];
    }
    return _reuseIdentifierSet;
}
@end
