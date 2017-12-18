#import "TGBackdropView.h"

#import "LegacyComponentsInternal.h"

@implementation TGBackdropView

+ (TGBackdropView *)viewWithLightNavigationBarStyle
{
    TGBackdropView *view = [[TGBackdropView alloc] init];
    view.backgroundColor = [UIColor colorWithRed: 27.0/255.0 green:157.0/255.0 blue:252.0/255.0 alpha:1];
    return view;
}

@end
