//
//  FinderSidebarWidth.m
//  FinderSidebarWidth
//
//  Created by Mark Villacampa on 16/06/15.
//  Copyright 2015. All rights reserved.
//

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
    [[[notification object] container] setSidebarWidthForScripting:150.0];
}

@end
