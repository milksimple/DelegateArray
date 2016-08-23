//
//  HaloDriver.h
//  DelegateArray
//
//  Created by mac on 16/8/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JXSingleton.h"

@protocol HaloDriverDelegate <NSObject>

@optional
- (void)haloDriverDidConnectLight;

@end

@interface HaloDriver : NSObject

JXSingletonH(HaloDriver)

- (void)addDelegate:(id<HaloDriverDelegate>)delegate;

@property (nonatomic, strong) NSMutableArray *delegateArray;

- (void)doSomething;

@end
