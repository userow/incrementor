//
//  BaseViewController.m
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-25.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (instancetype)storyboardInstance;
{
    UIStoryboard *story = [UIStoryboard storyboardWithName:NSStringFromClass([self class]) bundle:nil];
    
    id controller;
    
    controller = [story instantiateInitialViewController];
    
    if (controller && [controller isKindOfClass:[self class]]) {
        return controller;
    }
    
    controller = [story instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
    
    if (controller && [controller isKindOfClass:[self class]]) {
        return controller;
    } else {
        return nil;
    }
}

@end
