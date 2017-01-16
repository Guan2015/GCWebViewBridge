# GCWebViewBridge

### [1]测试OC调用JS
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
### [2]测试JS调用OC(实际上的回调)
    比如有这样一段JS
    <script>
        function test(){
            alert("test alert");
            return "0";
        }
    </script>
    <br>
    <br>
    在本demo中使用
    NSString *testUrl = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
    CGRect frame = [UIScreen mainScreen].bounds;
    GCWebView *webView = [[GCWebView alloc] initWithFrame:frame];
    [webView loadWithUrl:testUrl];
    [self.view addSubview:webView];
#### 在GCWebView.m中
    context[@"test"] = ^(){
        JSValue *value = [JSContext currentThis];
        NSLog(@"%@",value);
    };
    // 此处调用js中test() 会回调block
    [context evaluateScript:@"test()"];
