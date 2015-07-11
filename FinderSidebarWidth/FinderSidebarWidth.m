#import "FinderSidebarWidth.h"

@implementation FinderSidebarWidth
@dynamic pluginVersion;

+ (NSString *)pluginVersion
{
    return [[[NSBundle bundleForClass:self] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (void)load
{
    NSLog(@"FinderSidebarWidth %@ Loaded", self.pluginVersion);
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(windowDidBecomeMain:)
                                                 name:@"NSWindowDidBecomeMainNotification" object:nil];
    
}

+(void)windowDidBecomeMain:(NSNotification*)notification {
    id window = [notification object];
    
    if ([window respondsToSelector:@selector(container)]) {
        [[window container] setSidebarWidthForScripting:150.0];
    }
}

@end
