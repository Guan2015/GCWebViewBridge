//
//  GCWebView.m
//  GCWebViewBridgeDemo
//
//  Created by 哈帝 on 17/1/13.
//  Copyright © 2017年 guan. All rights reserved.
//

#import "GCWebView.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface GCWebView ()<UIWebViewDelegate>

@property (nonatomic ,copy)NSString *loadUrl;
@property (nonatomic ,strong)UIWebView *webView;

@end


@implementation GCWebView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        _webView = [[UIWebView alloc] initWithFrame:frame];
        _webView.delegate = self;
        [self addSubview:_webView];
    }
    
    return self;
}

- (void)setLoadUrl:(NSString *)loadUrl
{
    _loadUrl = loadUrl;
    
}

- (void)loadWithUrl:(NSString *)str
{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:str]];
    [_webView loadRequest:request];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // 通过当前WebView获取到jscontext
    JSContext *context = [_webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    
    /** [1] OC 调用 JS
     
    // 构造可执行JS
    NSString *jsString = @"alert('excute the js')";
    // 执行js
    [context evaluateScript:jsString];
     
     */
    
    /*  [2] JS 调用 OC */
    
    context[@"test"] = ^(){
        JSValue *value = [JSContext currentThis];
        NSLog(@"%@",value);
    };
    // 此处调用js中test() 会回调block
    [context evaluateScript:@"test()"];
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    // 可以进行请求拦截、判断达到自己想要的结果
    return YES;
}



@end
