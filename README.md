# GCWebViewBridge

## 有关OC与JS交互
*OC端与JS的交互，大致有这几种：拦截协议、JavaScriptCore库、WKWebView、自定义NSURLProtocol拦截、WebViewJavascriptBridge. 
*JavaScriptCore一个iOS7引进的标准库，JavaScriptCore是webkit的一个重要组成部分，主要是对JS进行解析和提供执行环境,代码是开源的，可以下下来看看[源码](https://github.com/phoboslab/JavaScriptCore-iOS)
*iOS7以前我们对JS的操作只有webview里面一个函数 stringByEvaluatingJavaScriptFromString，JS对OC的回调都是基于URL的拦截进行的操作
*iOS8后的WKWebView相对于UIWebView，具有更强大的功能。提供一个`WKScriptMessageHandler`,可以实现JS对WebView的调用
### 本demo是对JavaScriptCore用法做一个简单的整理
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
