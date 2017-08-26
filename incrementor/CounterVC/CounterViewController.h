//
//  CouterViewController.h
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-19.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseViewController.h"

#import "CounterViewProtocol.h"
#import "CounterPresenterProtocol.h"

@interface CounterViewController : BaseViewController <CounterViewProtocol>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *settingsBarButton;
@property (weak, nonatomic) IBOutlet UIButton *countButton;

@property (strong, nonatomic) id<CounterPresenterProtocol> presenter;

@end

