//
//  Router.m
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-23.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import "Router.h"

#import "CounterViewController.h"

#import "SettingsViewController.h"

@interface Router ()

@property (nonatomic, weak) UIWindow *window;

@property (nonatomic, strong) CounterViewController *counterVC;
@property (nonatomic, strong) SettingsViewController *settingsVC;

@end

@implementation Router

- (instancetype)init {
    if (self = [super init]) {
        [self initWindowAndNav];
    }
    
    return self;
}

-(UINavigationController*)embedInNavifgationController:(UIViewController *)vc {
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [navigation setNavigationBarHidden:YES animated:NO];
    
    return navigation;
}

-(void)initWindowAndNav;
{
    if (!_window) {
        _window = UIApplication.sharedApplication.delegate.window;
        
        if (!_window) {
            _window = [];
        }
    }
    if (!_navigationController)
    {
        _navigationController = [[UINavigationController alloc] init];
        [_navigationController setToolbarHidden:YES];
    }
}



- (void)showInitialViewController;
{
    [self initWindowAndNav];
    
    if (!_counterVC) {
        _counterVC = [CounterViewController storyboardInstance];
    }
    
    [_window setRootViewController:[self embedInNavifgationController:_counterVC]];
}

- (void)showSettings;
{
    ;
}

@end
