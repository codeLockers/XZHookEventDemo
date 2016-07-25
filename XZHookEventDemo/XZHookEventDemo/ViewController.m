//
//  ViewController.m
//  XZHookEventDemo
//
//  Created by 徐章 on 16/7/25.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "ViewController.h"
#import "XZHookObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //hook UIWindow‘s SendEvent method
    XZHookObject *hookSendEvent = [[XZHookObject alloc] init];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    btn.center = CGPointMake(160, 240);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventAllEvents];
    [self.view addSubview:btn];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnAction:(UIButton *)sender{

    NSLog(@"button Asction");
}

@end
