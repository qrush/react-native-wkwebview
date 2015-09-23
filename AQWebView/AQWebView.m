#import <WebKit/WebKit.h>
#import <UIKit/UIKit.h>
#import "AQWebView.h"
#import "RCTAutoInsetsProtocol.h"

// lots of code from https://github.com/facebook/react-native/blob/master/React/Views/RCTWebView.m

@interface AQWebView () <RCTAutoInsetsProtocol>
@end

@implementation AQWebView
{
    WKWebView *_webView;
    UIRefreshControl *_refreshControl;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        super.backgroundColor = [UIColor clearColor];
        _automaticallyAdjustContentInsets = YES;
        _contentInset = UIEdgeInsetsZero;

        _webView = [[WKWebView alloc] initWithFrame:self.bounds];
        [self addSubview:_webView];

        _refreshControl = [[UIRefreshControl alloc] init];
        [_refreshControl addTarget:self action:@selector(reload) forControlEvents:UIControlEventValueChanged];
        [_webView.scrollView addSubview:_refreshControl];
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

- (void)setContentInset:(UIEdgeInsets)contentInset
{
    _contentInset = contentInset;
    [RCTView autoAdjustInsetsForView:self
                      withScrollView:_webView.scrollView
                        updateOffset:NO];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    CGFloat alpha = CGColorGetAlpha(backgroundColor.CGColor);
    self.opaque = _webView.opaque = (alpha == 1.0);
    _webView.backgroundColor = backgroundColor;
}

- (UIColor *)backgroundColor
{
    return _webView.backgroundColor;
}

- (void)refreshContentInset
{
    [RCTView autoAdjustInsetsForView:self
                      withScrollView:_webView.scrollView
                        updateOffset:YES];
}

@end
