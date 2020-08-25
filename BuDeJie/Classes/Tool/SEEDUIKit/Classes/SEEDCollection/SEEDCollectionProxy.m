//
//  SEEDCollectionProxy.m
//  1haiiPhone
//
//  Created by mac on 2020/2/13.
//  Copyright © 2020 EHi. All rights reserved.
//

#import "SEEDCollectionProxy.h"

@implementation SEEDCollectionProxy
- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([@"_diffableDataSourceImpl" isEqualToString:NSStringFromSelector(aSelector)]) {
        return NO;
    }
    if ([_extraDelegate respondsToSelector:aSelector]) {
        return YES;
    }
    if ([_impDelegate respondsToSelector:aSelector]) {
        return YES;
    }
    return [super respondsToSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature;
    if ([_extraDelegate respondsToSelector:aSelector]) {
        signature = [(NSObject *)_extraDelegate methodSignatureForSelector:aSelector];
        
    } else if ([_impDelegate respondsToSelector:aSelector]) {
        signature = [(NSObject *)_impDelegate methodSignatureForSelector:aSelector];
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if ([_extraDelegate respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:_extraDelegate];
        
    } else if ([_impDelegate respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:_impDelegate];
    } else {
        NSLog(@"");
    }
}

@end
