//
//  ThirdViewController.m
//  DelegateArray
//
//  Created by mac on 16/8/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ThirdViewController.h"
#import "HaloDriver.h"

@interface ThirdViewController () <HaloDriverDelegate>

@property (nonatomic, strong) HaloDriver *haloDriver;

@end

@implementation ThirdViewController
#pragma mark - lazy
- (HaloDriver *)haloDriver {
    if (_haloDriver == nil) {
        _haloDriver = [HaloDriver sharedHaloDriver];
    }
    return _haloDriver;
}

- (IBAction)buttonClick:(id)sender {
    [self.haloDriver doSomething];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.haloDriver addDelegate:self];
}

#pragma mark - HaloDriverDelegate
- (void)haloDriverDidConnectLight {
    NSLog(@"3rdViewController - haloDriverDidConnectLight");
}

- (void)dealloc {
    NSLog(@"ThirdViewController - dealloc");
    
}

@end
