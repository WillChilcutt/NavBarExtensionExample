//
//  PushViewController.m
//  NavBarExtensionExample
//
//  Created by Will Chilcutt on 8/3/14.
//  Copyright (c) 2014 NSWill. All rights reserved.
//

#import "PushViewController.h"
#import "ExtendedNavigationViewController.h"

@interface PushViewController ()
{
    BOOL hasMovedView;
}
@end

@implementation PushViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"View %d",[self.navigationController.viewControllers indexOfObject:self]];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    if (hasMovedView == NO)
    {
        //hasMovedView = YES;
        ExtendedNavigationViewController *navController = (ExtendedNavigationViewController *)self.navigationController;
        
        CGFloat newYPoint = navController.transferProgressContainerView.frame.origin.y + navController.transferProgressContainerView.frame.size.height;
        CGFloat newHeight = self.view.frame.size.height - (newYPoint - self.view.frame.origin.y);
        [self.view setFrame:CGRectMake(self.view.frame.origin.x,
                                       newYPoint,
                                       self.view.frame.size.width,
                                       newHeight)];
    }
}

- (IBAction)pushNewViewController:(id)sender
{
    PushViewController *vc = [[PushViewController alloc] init];
    
    [self.navigationController pushViewController:vc
                                         animated:YES];
}

@end
