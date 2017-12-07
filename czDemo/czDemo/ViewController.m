//
//  ViewController.m
//  czDemo
//
//  Created by boosj on 2017/12/7.
//  Copyright © 2017年 boosj. All rights reserved.
//

#import "ViewController.h"
#import "GCDDemo.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GCDDemo * gcd = [GCDDemo new];
    [gcd dispatch_Semap];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
