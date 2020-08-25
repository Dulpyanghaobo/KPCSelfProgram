//
//  SEEDCollectionProxy.h
//  1haiiPhone
//
//  Created by mac on 2020/2/13.
//  Copyright © 2020 EHi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SEEDCollectionProxy : NSProxy

/// 默认实现代理方法
@property (nonatomic, weak) id<UICollectionViewDelegate, UICollectionViewDataSource> impDelegate;

/// 使用者额外想实现代理方法
@property (nonatomic, weak) id<UICollectionViewDelegate, UICollectionViewDataSource> extraDelegate;

/// 使用者额外想实现代理方法
//@property (nonatomic, weak) id<UIScrollViewDelegate> extraDelegate;
@end

NS_ASSUME_NONNULL_END
