//
//  HaloDriver.m
//  DelegateArray
//
//  Created by mac on 16/8/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HaloDriver.h"
#import "DelegateRef.h"

@interface HaloDriver()

@property (nonatomic, strong) DelegateRef *delegateRef;

@end

@implementation HaloDriver

JXSingletonM(HaloDriver)
#pragma mark - lazy
- (NSMutableArray *)delegateArray {
    if (_delegateArray == nil) {
        _delegateArray = [NSMutableArray array];
    }
    return _delegateArray;
}

- (DelegateRef *)delegateRef {
    if (_delegateRef == nil) {
        _delegateRef = [[DelegateRef alloc] init];
    }
    return _delegateRef;
}

- (void)doSomething {
    for (DelegateRef *delegateRef in self.delegateRef.array) {
        if ([delegateRef.delegateWeakReference respondsToSelector:@selector(haloDriverDidConnectLight)]) {
            [delegateRef.delegateWeakReference haloDriverDidConnectLight];
        }
        NSLog(@"delegateRef: %@, weakref: %@",delegateRef, delegateRef.delegateWeakReference);
    }
    NSLog(@"array has %ld delegates", [self.delegateRef.array count]);
}

- (void)addDelegate:(id<HaloDriverDelegate>)delegate {
    if (![self.delegateRef.array containsObject:delegate]) {
        [self.delegateRef addWeakRef:delegate];
    }
}

@end
