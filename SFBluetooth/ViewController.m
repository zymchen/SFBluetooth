//
//  ViewController.m
//  SFBluetooth
//
//  Created by Picooc on 2016/12/5.
//  Copyright © 2016年 picooc. All rights reserved.
//

#import "ViewController.h"
#import "SFBluetooth.h"
@interface ViewController ()
@property (nonatomic, strong) SFBluetooth *blueTooth;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.blueTooth = [[SFBluetooth alloc] init];
    [self.blueTooth startBluetooth];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
