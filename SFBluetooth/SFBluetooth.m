//
//  SFBluetooth.m
//  SFBluetooth
//
//  Created by Picooc on 2016/12/5.
//  Copyright © 2016年 picooc. All rights reserved.
//

#import "SFBluetooth.h"
#import <CoreBluetooth/CoreBluetooth.h>
@interface SFBluetooth () <CBCentralManagerDelegate>
@property (nonatomic, strong) CBCentralManager *centralManager;

@end

@implementation SFBluetooth

- (void)startBluetooth {
    self.centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    switch (central.state) {
        case CBManagerStatePoweredOff:
        case CBManagerStateUnknown:
        case CBManagerStateResetting:
        case CBManagerStateUnsupported:
        case CBManagerStateUnauthorized:
            break;
        case CBManagerStatePoweredOn: {
            NSLog(@"蓝牙开启");
            [self scan];
        }
        default:
            break;
    }
}

- (void)scan {
    NSDictionary * options = [NSDictionary dictionaryWithObject:@(NO) forKey:CBCentralManagerScanOptionAllowDuplicatesKey];
    [self.centralManager scanForPeripheralsWithServices:nil options:options];
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {
    NSLog(@"name: %@", peripheral.name);
}


@end
