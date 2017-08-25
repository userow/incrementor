//
//  AppDelegate.h
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-19.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Router;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) Router *router;

@end

