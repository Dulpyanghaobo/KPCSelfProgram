//
//  SEEDCollectionReusableView.m
//  1haiiPhone
//
//  Created by GanXiaoteng on 2020/2/29.
//  Copyright © 2020 EHi. All rights reserved.
//

#import "SEEDCollectionReusableView.h"
#import "SEEDCollectionViewLayoutAttributes.h"

@implementation SEEDCollectionReusableView
- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    if ([layoutAttributes isKindOfClass:[SEEDCollectionViewLayoutAttributes class]]) {
        self.backgroundColor = [(SEEDCollectionViewLayoutAttributes *)layoutAttributes sectionBgColor];
    }
}
@end
