//
//  Router.h
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-23.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "BaseViewController.h"

@interface Router : NSObject

@property (strong, nonatomic) UINavigationController *navigationController;

- (void)showInitialViewController;

- (void)showSettings;

@end
