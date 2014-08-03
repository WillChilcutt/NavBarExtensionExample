//
//  ExtendedNavigationViewController.m
//  NavBarExtensionExample
//
//  Created by Will Chilcutt on 8/3/14.
//  Copyright (c) 2014 NSWill. All rights reserved.
//

#import "ExtendedNavigationViewController.h"

@interface ExtendedNavigationViewController ()
{
    UIProgressView *progressView;
}
@end

@implementation ExtendedNavigationViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationBar setTranslucent:NO];
    
    CGFloat newYPoint =  self.navigationBar.frame.origin.y + self.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height;
    
    CGRect transferProgressContainerViewFrame = CGRectMake(self.navigationBar.frame.origin.x,
                                                           newYPoint,
                                                           self.navigationBar.frame.size.width,
                                                           100);
    
    self.transferProgressContainerView = [[UIView alloc] initWithFrame:transferProgressContainerViewFrame];
    [self.transferProgressContainerView setBackgroundColor:[UIColor orangeColor]];
    
    [self.view addSubview:self.transferProgressContainerView];

    progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    [progressView setTintColor:[UIColor whiteColor]];
    [progressView setProgress:.5];
    [progressView setFrame:CGRectMake(0, 50, transferProgressContainerViewFrame.size.width, 5)];
    [self.transferProgressContainerView addSubview:progressView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 320, 20)];
    [label setTextColor:[UIColor whiteColor]];
    [label setText:@"Progress container view in the nav bar"];
    [label setTextAlignment:NSTextAlignmentCenter];
    [self.transferProgressContainerView addSubview:label];
    
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(updateProgressview)
                                   userInfo:nil
                                    repeats:YES];
}

-(void)updateProgressview
{
    if (progressView.progress < 1)
    {
        [progressView setProgress:progressView.progress+.1
                         animated:YES];
    }
    else
    {
        [progressView setProgress:0
                         animated:NO];
    }
}


@end
