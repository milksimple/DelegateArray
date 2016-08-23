//
//  DelegateRef.h
//  DelegateArray
//
//  Created by mac on 16/8/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HaloDriver.h"

@interface DelegateRef : NSObject

@property(nonatomic, weak)id<HaloDriverDelegate> delegateWeakReference;

@property (nonatomic, strong) NSMutableArray *array;

-(void)addWeakRef:(id)ref;

@end
