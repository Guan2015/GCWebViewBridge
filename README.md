# GCWebViewBridge

### 测试OC调用JS
    NSString *testUrl = @"https://www.baidu.com";
    CGRect frame = [UIScreen mainScreen].bounds;
    GCWebView *webView = [[GCWebView alloc] initWithFrame:frame];
    [webView loadWithUrl:testUrl]
    [self.view addSubview:webView];
#### 在GCWebView.m中
    // 构造可执行JS
    NSString *jsString = @"alert('excute the js')";
    // 执行js
    [context evaluateScript:jsString];
