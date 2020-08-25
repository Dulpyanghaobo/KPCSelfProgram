//
//  SEEDCollectionViewModelDelegate.h
//  Pods-SEEDkit_Example
//
//  Created by GanXiaoteng on 2020/3/11.
//

#import <Foundation/Foundation.h>
#import "SEEDCollectionViewDelegate.h" 
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SEEDCollectionViewModelDelegate <NSObject> 
 
@property (nonatomic, weak) __kindof UICollectionView <SEEDCollectionViewDelegate> *seed_collectionViewDelegate;
@end

NS_ASSUME_NONNULL_END
