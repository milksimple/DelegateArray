//
//  DelegateRef.m
//  DelegateArray
//
//  Created by mac on 16/8/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "DelegateRef.h"
#import <objc/runtime.h>
@interface WeakWatcher : NSObject
@property (nonatomic, weak) NSMutableArray *masterarray;
@property (nonatomic, weak) DelegateRef *delegateRef;
@end
@implementation WeakWatcher

-(void)dealloc
{
    if(_delegateRef != nil)
    {
        if([self.masterarray containsObject:_delegateRef])
        {
            NSLog(@"Removing %@ from array", _delegateRef);
            [_masterarray removeObject:_delegateRef];
        }
    }
    NSLog(@"Watch %@ dealloc", self);
}

@end

@interface DelegateRef()

@end

@implementation DelegateRef

static char assoKey[] = "assoKey";

-(instancetype)init
{
    NSLog(@"%@ init", self);
    return self;
}
- (NSMutableArray *)array {
    if (_array == nil) {
        _array = [NSMutableArray array];
    }
    return _array;
}

-(void)addWeakRef:(id)ref
{
    if (ref == nil) {
        return;
    }
    DelegateRef *delRef = [DelegateRef new];
    WeakWatcher* watcher = [WeakWatcher new];
    watcher.delegateRef = delRef;
    watcher.masterarray = self.array;
    
    [delRef setDelegateWeakReference:ref];
    objc_setAssociatedObject(ref, assoKey, watcher, OBJC_ASSOCIATION_RETAIN);
    
    [self.array addObject:delRef];
    
}
-(void)setDelegateWeakReference:(id<HaloDriverDelegate>)delegateWeakReference
{
    if(delegateWeakReference == nil) {
    }else {
        _delegateWeakReference = delegateWeakReference;
    }
    NSLog(@"%@ ref set to %@", self, delegateWeakReference);
}
-(void)dealloc
{
    NSLog(@"DelegateRef %@ dealloc", self);
}

@end
