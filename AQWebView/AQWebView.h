#import "RCTView.h"

@interface AQWebView : RCTView

@property (nonatomic, strong) NSURL *URL;
- (void)reload;

@end
