//
//  SettingsViewController.h
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-23.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseViewController.h"

#import "SettingsPresenter.h"

@interface SettingsViewController : BaseViewController <SettingsViewProtocol>

@property (strong, nonatomic) SettingsPresenter *presenter;

@property (weak, nonatomic) IBOutlet UITextField *incrementTextField;
@property (weak, nonatomic) IBOutlet UITextField *limitTextField;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;

- (IBAction)resetButtonTapped:(id)sender;

@end
