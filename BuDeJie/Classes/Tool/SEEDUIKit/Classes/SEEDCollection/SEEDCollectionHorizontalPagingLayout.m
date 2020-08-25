//
//  SEEDCollectionHorizontalPagingLayout.m
//  AFNetworking
//
//  Created by GanXiaoteng on 2020/3/21.
//

#import "SEEDCollectionHorizontalPagingLayout.h"
#import "tgmath.h"
#import "SEEDCollectionViewLayoutAttributes.h"
#import "SEEDCollectionHorizontalPagingSectionItem.h"
#import "SEEDCollectionView.h"
#import "SEEDCollectionReusableView.h"

#define SEEDDecorationReuseIdentifier @"SEEDDecorationReuseIdentifier"
@interface SEEDCollectionHorizontalPagingLayout ()
/// Array to store height for each column
@property (nonatomic, strong) NSMutableArray *lineWidths;

///  二维数组 section对应item的布局有关的属性的数组
@property (nonatomic, strong) NSMutableArray *sectionItemAttributes;

/// section的布局有关的属性的数组
@property (nonatomic, strong) NSMutableArray *sectionAttributes;

/// item的布局有关的属性的数组
@property (nonatomic, strong) NSMutableArray<UICollectionViewLayoutAttributes *> *allItemAttributes;

/// Sections数组
@property (nonatomic, strong, nonnull) NSMutableArray <SEEDCollectionHorizontalPagingSectionItem *> *items;

@end

@implementation SEEDCollectionHorizontalPagingLayout

static CGFloat SEEDFloorCGFloat(CGFloat value) {
    return floor(value);
}


#pragma mark - set/get
- (NSMutableArray *)lineWidths {
    if (!_lineWidths) {
        _lineWidths = [NSMutableArray array];
    }
    return _lineWidths;
}

- (NSMutableArray *)allItemAttributes {
    if (!_allItemAttributes) {
        _allItemAttributes = [NSMutableArray  array];
    }
    return _allItemAttributes;
}

- (NSMutableArray *)sectionItemAttributes {
    if (!_sectionItemAttributes) {
        _sectionItemAttributes = [NSMutableArray array];
    }
    return _sectionItemAttributes;
}

- (NSMutableArray *)sectionAttributes {
    if (!_sectionAttributes) {
        _sectionAttributes = [NSMutableArray array];
    }
    return _sectionAttributes;
}


#pragma mark - Init
- (void)commonInit {
}

- (id)init {
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

#pragma mark - Methods to Override

/// 设置layout的结构和初始需要的参数等。
- (void)prepareLayout {
    [super prepareLayout];
    [self registerClass:[SEEDCollectionReusableView class] forDecorationViewOfKind:SEEDDecorationReuseIdentifier];
    [self.lineWidths removeAllObjects];
    [self.allItemAttributes removeAllObjects];
    [self.sectionItemAttributes removeAllObjects];
    [self.sectionAttributes removeAllObjects];
    
    NSInteger numberOfSections = [self.collectionView numberOfSections];
    if (numberOfSections != 1 ) {
        return;
    }
    for (NSInteger section = 0; section < numberOfSections; section++) {
        NSMutableArray <SEEDCollectionHorizontalPagingSectionItem *> *items = ((SEEDCollectionView *)self.collectionView).items;
        SEEDCollectionHorizontalPagingSectionItem *item = [items objectAtIndex:section];
        NSInteger lineCount = item.seed_lineCount;
        NSMutableArray *sectionlineWidths = [NSMutableArray arrayWithCapacity:lineCount];
        for (NSInteger idx = 0; idx < lineCount; idx++) {
            [sectionlineWidths addObject:@(0)];
        }
        [self.lineWidths addObject:sectionlineWidths];
    }
    
    
    
    
    
    // Create attributes
    CGFloat left = 0;
    for (NSInteger section = 0; section < numberOfSections; ++section) {
        NSMutableArray <SEEDCollectionHorizontalPagingSectionItem *> *items = ((SEEDCollectionView *)self.collectionView).items;
        SEEDCollectionHorizontalPagingSectionItem *sectionItem = [items objectAtIndex:section];
        CGFloat lineSpacing = sectionItem.seed_verticalSpacing;
        CGFloat columnSpacing = sectionItem.seed_horizontalSpacing;
        UIEdgeInsets sectionInset = sectionItem.seed_sectionInset;
        NSInteger lineCount = sectionItem.seed_lineCount;
        NSInteger columnCount = sectionItem.seed_columnCount;
        CGFloat contentHeigh = self.collectionView.bounds.size.height - sectionInset.top - sectionInset.bottom;
        CGFloat itemHeigh = SEEDFloorCGFloat((contentHeigh - (lineCount - 1) * columnSpacing) / lineCount);
        CGFloat contentWidth = self.collectionView.bounds.size.width - sectionInset.left - sectionInset.right;
        CGFloat itemWidth = SEEDFloorCGFloat((contentWidth - (columnCount - 1) * lineSpacing) / columnCount);
        
        
        left += sectionInset.left;
        for (NSInteger idx = 0; idx < lineCount; idx++) {
            self.lineWidths[section][idx] = @(left);
        }
         
        
        NSInteger itemCount = [self.collectionView numberOfItemsInSection:section];
        NSMutableArray *itemAttributes = [NSMutableArray arrayWithCapacity:itemCount];
        for (NSInteger idx = 0; idx < itemCount; idx++) {
            NSMutableArray <SEEDCollectionHorizontalPagingSectionItem *> *items = ((SEEDCollectionView *)self.collectionView).items;
            SEEDCollectionHorizontalPagingSectionItem *sectionItem = [items objectAtIndex:section];
            __kindof NSObject<SEEDCollectionCellItemProtocol> *item = [sectionItem.seed_cellItems objectAtIndex:idx];
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:idx inSection:section];
            item.seed_indexPath = indexPath;
            item.seed_cellSize = CGSizeMake(itemWidth, itemHeigh);
            NSUInteger lineIndex = 0;
            if (sectionItem.seed_sectionItemType == SEEDPagingSectionItemType_Left) {
               lineIndex = [self leftRight_nextLineIndexForItem:idx inSection:section];
            }else if (sectionItem.seed_sectionItemType == SEEDPagingSectionItemType_Top) {
               lineIndex = [self upDown_nextLineIndexForItem:idx inSection:section];
            }
             
            CGFloat yOffset = sectionInset.top + (itemHeigh + lineSpacing) * lineIndex;
            CGFloat xOffset = [_lineWidths[section][lineIndex] floatValue];
            UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            attributes.frame = CGRectMake(xOffset, yOffset, itemWidth, itemHeigh);
            [itemAttributes addObject:attributes];
            [self.allItemAttributes addObject:attributes];
            
            if (idx % (lineCount * columnCount) == lineCount * columnCount -1 && idx != 0) { 
                for (NSInteger idx = 0; idx < lineCount; idx++) {
                    self.lineWidths[section][idx] =@(CGRectGetMaxX(attributes.frame) + sectionItem.seed_sectionInset.left + sectionItem.seed_sectionInset.right);
                }
            }else {
                self.lineWidths[section][lineIndex] = @(CGRectGetMaxX(attributes.frame) + columnSpacing);
            }
        }
        
        [self.sectionItemAttributes addObject:itemAttributes];
        NSUInteger lineIndex = [self longestLineIndexInSection:section];
        if (((NSArray *)self.lineWidths[section]).count > 0) {
            left = [self.lineWidths[section][lineIndex] floatValue] - columnSpacing + sectionInset.right;
        } else {
            left = 0;
        }
        for (NSInteger idx = 0; idx < lineCount; idx++) {
            self.lineWidths[section][idx] = @(left);
        }
        
        CGRect firstSize = self.allItemAttributes.count > 0 ?  [self.allItemAttributes firstObject].frame : CGRectZero;
        CGRect lastSize = self.allItemAttributes.count > 0 ?  [self.allItemAttributes firstObject].frame : CGRectZero;;
        CGRect sectionFrame = CGRectUnion(firstSize, lastSize);
        sectionFrame.origin.x -= sectionItem.seed_sectionInset.left;
        sectionFrame.origin.y -= sectionItem.seed_sectionInset.top;
        sectionFrame.size.height = self.collectionView.frame.size.height;
        sectionFrame.size.width += sectionItem.seed_sectionInset.left + sectionItem.seed_sectionInset.right;
        SEEDCollectionViewLayoutAttributes *decorationAttributes =
        [SEEDCollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:SEEDDecorationReuseIdentifier
                                                                      withIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
        decorationAttributes.frame = sectionFrame;
        decorationAttributes.zIndex = -1;
        decorationAttributes.sectionBgColor = sectionItem.seed_sectionBgColor;
        [self.sectionAttributes addObject:decorationAttributes];
    }
}

/// 返回collectionView的内容的尺寸
- (CGSize)collectionViewContentSize {
     
    NSInteger numberOfSections = [self.collectionView numberOfSections];
    if (numberOfSections == 0) {
        return CGSizeZero;
    }
    SEEDCollectionHorizontalPagingSectionItem <SEEDCollectionSectionItemProtocol> *sectionItem = [((SEEDCollectionView *)self.collectionView).items firstObject];
    NSInteger count = ceil(sectionItem.seed_cellItems.count / (sectionItem.seed_columnCount * sectionItem.seed_lineCount * 1.0));
    
    CGSize contentSize = self.collectionView.bounds.size;
    contentSize.width = MAX(count * contentSize.width, contentSize.width);
    return contentSize;
}

/// 返回对应于indexPath的位置的cell的布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)path {
    if (path.section >= [self.sectionItemAttributes count]) {
        return nil;
    }
    if (path.item >= [self.sectionItemAttributes[path.section] count]) {
        return nil;
    }
    return (self.sectionItemAttributes[path.section])[path.item];
}

/// 返回对应于indexPath的位置的追加视图的布局属性，如果没有追加视图可不重载
- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attribute = nil;
    
    return attribute;
}

/// 返回rect中的所有的元素的布局属性
/// 返回的是包含UICollectionViewLayoutAttributes的NSArray
/// UICollectionViewLayoutAttributes可以是cell，追加视图或装饰视图的信息，通过不同的UICollectionViewLayoutAttributes初始化方法可以得到不同类型的UICollectionViewLayoutAttributes：
///1)layoutAttributesForCellWithIndexPath:
///2)layoutAttributesForSupplementaryViewOfKind:withIndexPath:
///3)layoutAttributesForDecorationViewOfKind:withIndexPath:

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString*)elementKind atIndexPath:(NSIndexPath *)indexPath {
    if ([elementKind isEqualToString:SEEDDecorationReuseIdentifier]) {
        return [self.sectionAttributes objectAtIndex:indexPath.section];
    }
    return [super layoutAttributesForDecorationViewOfKind:elementKind atIndexPath:indexPath];
}



- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    for (UICollectionViewLayoutAttributes *attr in self.sectionAttributes) {
        if (CGRectIntersectsRect(rect, attr.frame)) {
            [self.allItemAttributes addObject:attr];
        }
    }
    return self.allItemAttributes;
}


/// 当边界发生改变时，是否应该刷新布局。如果YES则在边界变化（一般是scroll到其他地方）时，将重新计算需要的布局信息。
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    CGRect oldBounds = self.collectionView.bounds;
    if (CGRectGetWidth(newBounds) != CGRectGetWidth(oldBounds) || CGRectGetHeight(newBounds) != CGRectGetHeight(oldBounds)) {
        return YES;
    }
    return NO;
}

#pragma mark - Private Methods
 

/// 查找 section中item的height最大的index
- (NSUInteger)longestLineIndexInSection:(NSInteger)section {
    __block NSUInteger index = 0;
    __block CGFloat longestHeight = 0;
    
    [self.lineWidths[section] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CGFloat height = [obj floatValue];
        if (height > longestHeight) {
            longestHeight = height;
            index = idx;
        }
    }];
    
    return index;
}

/// 返回下一行的索引 左右布局
- (NSUInteger)leftRight_nextLineIndexForItem:(NSInteger)item inSection:(NSInteger)section {
    NSUInteger index = 0;
    NSInteger lineCount = 0;
    NSMutableArray <SEEDCollectionHorizontalPagingSectionItem *> *items = ((SEEDCollectionView *)self.collectionView).items;
    SEEDCollectionHorizontalPagingSectionItem *sectionItem = [items objectAtIndex:section];
    lineCount = sectionItem.seed_lineCount;
    index = (item % lineCount);
    return index;
}

/// 返回下一行的索引 上下布局
- (NSUInteger)upDown_nextLineIndexForItem:(NSInteger)item inSection:(NSInteger)section {
    NSUInteger index = 0;
    NSMutableArray <SEEDCollectionHorizontalPagingSectionItem *> *items = ((SEEDCollectionView *)self.collectionView).items;
    SEEDCollectionHorizontalPagingSectionItem *sectionItem = [items objectAtIndex:section];
    NSInteger num =  item % (sectionItem.seed_lineCount * sectionItem.seed_columnCount);
    index = floor (num / sectionItem.seed_columnCount);
    return index;
}

@end
