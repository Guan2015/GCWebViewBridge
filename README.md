# GCWebViewBridge

### 测试OC调用JS
NSString *testUrl = @"https://www.baidu.com";
CGRect frame = [UIScreen mainScreen].bounds;
GCWebView *webView = [[GCWebView alloc] initWithFrame:frame];
[webView loadWithUrl:testUrl]
[self.view addSubview:webView];
