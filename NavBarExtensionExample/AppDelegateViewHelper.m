//
//  AppDelegateViewHelper.m
//  NavBarExtensionExample
//
//  Created by Will Chilcutt on 8/3/14.
//  Copyright (c) 2014 NSWill. All rights reserved.
//

#import "AppDelegateViewHelper.h"
#import "PushViewController.h"
#import "ExtendedNavigationViewController.h"
@implementation AppDelegateViewHelper

-(void)setUpForWindow:(UIWindow *)window
{
    PushViewController *vc = [[PushViewController alloc] init];
    
    ExtendedNavigationViewController *navController = [[ExtendedNavigationViewController alloc] initWithRootViewController:vc];

    [window setRootViewController:navController];
    [window makeKeyAndVisible];
}

@end
