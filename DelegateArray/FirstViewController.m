//
//  FirstViewController.m
//  DelegateArray
//
//  Created by mac on 16/8/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FirstViewController.h"
#import "HaloDriver.h"

@interface FirstViewController () <HaloDriverDelegate>

@property (nonatomic, strong) HaloDriver *haloDriver;

@end

@implementation FirstViewController
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
    NSLog(@"FirstViewController - haloDriverDidConnectLight");
}

@end
