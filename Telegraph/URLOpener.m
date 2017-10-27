#import "URLOpener.h"

@implementation URLOpener

@synthesize url, browser;

- (id) initWithURL:(NSURL *)u
{
    self = [super init];
    if (self) {
        self.url = u;
    }
    return self;
}

- (id) initWithBrowser:(NSString *)b
{
    self = [super init];
    if (self) {
        self.browser = b;
    }
    return self;
}

- (id) initWithURL:(NSURL *)u browser:(NSString *)b
{
    self = [super init];
    if (self) {
        self.url = u;
        self.browser = b;
    }
    return self;
}

- (id) initWithURLString:(NSString *)us browser:(NSString *)b
{
    NSURL * u = [NSURL URLWithString:us];
    return [self initWithURL:u browser:b];
}


- (BOOL)openURL
{
    if ([BROWSER_CHROME compare:self.browser options:NSCaseInsensitiveSearch] == NSOrderedSame) {
        return [self openInChrome];
    } else  if ([BROWSER_OPERA compare:self.browser options:NSCaseInsensitiveSearch] == NSOrderedSame) {
        return [self openInOperaMini];
    } else  if ([BROWSER_ICAB compare:self.browser options:NSCaseInsensitiveSearch] == NSOrderedSame) {
        return [self openInICabMobile];
    } else  if ([BROWSER_FIREFOX compare:self.browser options:NSCaseInsensitiveSearch] == NSOrderedSame) {
        return [self openInFirefox];
    }else  if ([[UIApplication sharedApplication] canOpenURL:self.url] )
    {
        return [[UIApplication sharedApplication] openURL:self.url];
    } else {
        NSLog(@"Could not open url: %@", self.url);
        return NO;
    }
}

- (BOOL) openInICabMobile
{
    // is icabmobile installed??
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"icabmobile://"]])
    {
        NSString *scheme = self.url.scheme;
        
        // Replace the URL Scheme with the Chrome equivalent.
        NSString * chromeScheme = nil;
        if ([scheme compare:@"http" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            chromeScheme = @"icabmobile";
        } else if ([scheme compare:@"https" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            chromeScheme = @"icabmobiles";
        }
        
        if (chromeScheme) {
            NSString *absoluteString = [self.url absoluteString];
            NSRange rangeForScheme = [absoluteString rangeOfString:@":"];
            NSString *urlNoScheme = [absoluteString substringFromIndex:rangeForScheme.location];
            NSString *chromeURLString = [chromeScheme stringByAppendingString:urlNoScheme];
            NSURL *chromeURL = [NSURL URLWithString:chromeURLString];
            return [[UIApplication sharedApplication] openURL:chromeURL];
        } else {
            return [[UIApplication sharedApplication] openURL:self.url];
        }
        
    } else {
        return false;//[[UIApplication sharedApplication] openURL:self.url];
    }
}

- (BOOL)isChromeAvailable{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"googlechrome://"]])
    {
        return TRUE;
    }
    return FALSE;
}
- (BOOL)isOperaAvailable{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"ohttp://"]])
    {
        return TRUE;
    }
    return FALSE;
}

- (BOOL)isMozillaAvailable{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"firefox://"]])
    {
        return TRUE;
    }
    return FALSE;
}

- (BOOL)isICabAvailable{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"icabmobile://"]])
    {
        return TRUE;
    }
    return FALSE;
}


- (BOOL) openInFirefox
{
    // is chrome installed??
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"firefox://"]])
    {
        NSString *scheme = self.url.scheme;
        
        // Replace the URL Scheme with the Chrome equivalent.
        NSString * chromeScheme = nil;
        if ([scheme compare:@"http" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            chromeScheme = @"firefox";
        } else if ([scheme compare:@"https" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            chromeScheme = @"firefoxs";
        }
        
        if (chromeScheme) {
            NSString *absoluteString = [self.url absoluteString];
            NSRange rangeForScheme = [absoluteString rangeOfString:@":"];
            NSString *urlNoScheme = [absoluteString substringFromIndex:rangeForScheme.location];
            NSString *chromeURLString = [chromeScheme stringByAppendingString:urlNoScheme];
            NSURL *chromeURL = [NSURL URLWithString:chromeURLString];
            return [[UIApplication sharedApplication] openURL:chromeURL];
        } else {
            return [[UIApplication sharedApplication] openURL:self.url];
        }
        
    } else {
        return [[UIApplication sharedApplication] openURL:self.url];
    }
}


- (BOOL) openInChrome
{
    // is chrome installed??
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"googlechrome://"]])
    {
        NSString *scheme = self.url.scheme;
        
        // Replace the URL Scheme with the Chrome equivalent.
        NSString * chromeScheme = nil;
        if ([scheme compare:@"http" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            chromeScheme = @"googlechrome";
        } else if ([scheme compare:@"https" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            chromeScheme = @"googlechromes";
        }
        
        if (chromeScheme) {
            NSString *absoluteString = [self.url absoluteString];
            NSRange rangeForScheme = [absoluteString rangeOfString:@":"];
            NSString *urlNoScheme = [absoluteString substringFromIndex:rangeForScheme.location];
            NSString *chromeURLString = [chromeScheme stringByAppendingString:urlNoScheme];
            NSURL *chromeURL = [NSURL URLWithString:chromeURLString];
            return [[UIApplication sharedApplication] openURL:chromeURL];
        } else {
            return [[UIApplication sharedApplication] openURL:self.url];
        }
        
    } else {
        return [[UIApplication sharedApplication] openURL:self.url];
    }
}

- (BOOL) openInOperaMini
{
    // is opera mini installed??
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"ohttp://"]])
    {
        NSString *scheme = self.url.scheme;
        
        // Replace the URL Scheme with the opera equivalent.
        NSString * operaScheme = nil;
        if ([scheme compare:@"http" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            operaScheme = @"ohttp";
        } else if ([scheme compare:@"https" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            operaScheme = @"ohttps";
        }
        
        if (operaScheme) {
            NSString *absoluteString = [self.url absoluteString];
            NSRange rangeForScheme = [absoluteString rangeOfString:@":"];
            NSString *urlNoScheme = [absoluteString substringFromIndex:rangeForScheme.location];
            NSString *operaURLString = [operaScheme stringByAppendingString:urlNoScheme];
            NSURL *operaURL = [NSURL URLWithString:operaURLString];
            return [[UIApplication sharedApplication] openURL:operaURL];
        } else {
            return [[UIApplication sharedApplication] openURL:self.url];
        }
        
    } else {
        return [[UIApplication sharedApplication] openURL:self.url];
    }
}

- (void) dealloc {
    //[url release];
    //[browser release];
    
    //[super dealloc];
}

@end
