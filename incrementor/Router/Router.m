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

#import "CounterPresenter.h"
#import "SettingsPresenter.h"

@interface Router ()

@property (nonatomic, weak) UIWindow *window;

//@property (nonatomic, strong) CounterViewController *counterVC;
//@property (nonatomic, strong) SettingsViewController *settingsVC;

@property (strong, nonatomic) UINavigationController *navigationController;

@end

@implementation Router

- (instancetype)init {
    if (self = [super init]) {
        ;
    }
    
    return self;
}

+ (instancetype)newWithWindow:(UIWindow *)window; {
    Router * router = [Router new];
    
    router.window = window;
    
    [router initWindowAndNavigation];
    
    return router;
}


- (UINavigationController*)embedInNavifgationController:(UIViewController *)vc
{
    [_navigationController setViewControllers:@[vc] animated:YES];
    
    return _navigationController;
}

-(void)initWindowAndNavigation;
{
    if (!_window) {
        _window = UIApplication.sharedApplication.delegate.window;
    }
    if (!_navigationController)
    {
        _navigationController = [[UINavigationController alloc] init];
    }
}



- (void)showInitialViewController;
{
    if ([_navigationController.topViewController isKindOfClass:[SettingsViewController class]])
    {
        [_navigationController popViewControllerAnimated:YES];
    }
    else
    {
        //assembling MVP
        CounterViewController *counterVC = [CounterViewController storyboardInstance];
        Counter *couter = [Counter loadCounter];
        CounterPresenter *presenter = [[CounterPresenter alloc] initWithView:counterVC model:couter];
        counterVC.presenter = presenter;
        
        [_window setRootViewController:[self embedInNavifgationController:counterVC]];
    }
}

- (void)showSettings;
{
    if (![_navigationController.topViewController isKindOfClass:[SettingsViewController class]])
    {
        //assembling MVP
        SettingsViewController *settingsVC = [SettingsViewController storyboardInstance];
        Counter *couter = [Counter loadCounter];
        SettingsPresenter *presenter = [[SettingsPresenter alloc] initWithView:settingsVC
                                                                         model:couter];
        settingsVC.presenter = presenter;
        
        [_navigationController pushViewController:settingsVC animated:YES];
    }
}

@end
