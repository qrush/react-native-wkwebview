#import "AQWebView.h"
#import <WebKit/WebKit.h>

// lots of code from https://github.com/facebook/react-native/blob/master/React/Views/RCTWebView.m

@implementation AQWebView
{
    WKWebView *_webView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        super.backgroundColor = [UIColor clearColor];
        _webView = [[WKWebView alloc] initWithFrame:self.bounds];
        [self addSubview:_webView];
    }
    return self;
}

- (void)reload
{
    [_webView reload];
}

- (NSURL *)URL
{
    return _webView.URL;
}

- (void)setURL:(NSURL *)URL
{
    [_webView loadRequest:[NSURLRequest requestWithURL:URL]];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _webView.frame = self.bounds;
}

@end
