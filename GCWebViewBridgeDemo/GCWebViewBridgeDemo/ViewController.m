//
//  ViewController.m
//  GCWebViewBridgeDemo
//
//  Created by 哈帝 on 17/1/13.
//  Copyright © 2017年 guan. All rights reserved.
//

#import "ViewController.h"
#import "GCWebView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSString *testUrl = @"https://www.baidu.com"; [1]
    // [2] 加载本定html
    NSString *testUrl = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
    
    CGRect frame = [UIScreen mainScreen].bounds;
    GCWebView *webView = [[GCWebView alloc] initWithFrame:frame];
    [webView loadWithUrl:testUrl];
    [self.view addSubview:webView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
