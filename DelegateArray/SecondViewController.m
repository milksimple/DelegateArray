//
//  SecondViewController.m
//  DelegateArray
//
//  Created by mac on 16/8/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SecondViewController.h"
#import "HaloDriver.h"

@interface SecondViewController () <HaloDriverDelegate>

@property (nonatomic, strong) HaloDriver *haloDriver;

@end

@implementation SecondViewController

#pragma mark - lazy
- (HaloDriver *)haloDriver {
    if (_haloDriver == nil) {
        _haloDriver = [HaloDriver sharedHaloDriver];
    }
    return _haloDriver;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.haloDriver addDelegate:self];
}

#pragma mark - HaloDriverDelegate
- (void)haloDriverDidConnectLight {
    NSLog(@"SecondViewController - haloDriverDidConnectLight");
}


@end
