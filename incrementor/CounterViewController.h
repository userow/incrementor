//
//  CouterViewController.h
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-19.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CounterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *currentVlaueLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *settingsBarButton;
@property (weak, nonatomic) IBOutlet UIButton *incrementButton;

@end

