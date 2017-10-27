//
//  URLOpener.h
//  Telegraph
//
//  Created by Admin on 02.05.17.
//
//

#ifndef URLOpener_h
#define URLOpener_h


#define BROWSER_CHROME  @"chrome"
#define BROWSER_OPERA   @"opera"
#define BROWSER_ICAB   @"icabmobile"
#define BROWSER_FIREFOX  @"firefox"

@interface URLOpener : NSObject

@property (nonatomic, retain) NSURL * url;
@property (nonatomic, retain) NSString * browser;

- (id) initWithURL:(NSURL *)u;
- (id) initWithBrowser:(NSString *)b;
- (id) initWithURL:(NSURL *)u browser:(NSString *)b;
- (id) initWithURLString:(NSString *)us browser:(NSString *)b;

- (BOOL)openURL;

- (BOOL)isChromeAvailable;
- (BOOL)isOperaAvailable;
- (BOOL)isMozillaAvailable;
- (BOOL)isICabAvailable;

@end

#endif /* URLOpener_h */
