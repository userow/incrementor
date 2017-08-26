//
//  SettingsViewController.m
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-23.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController () <UITextFieldDelegate>

@end

@implementation SettingsViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - actions

- (IBAction)resetButtonTapped:(id)sender;
{
    [self.presenter doResetCounter];
}

#pragma mark - textFields delegate methods

- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string;
{
    BOOL shouldChange = NO;
    
    NSCharacterSet* notDigits = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"]  invertedSet];
    
    //Check if all string characters are decimal
    if ([string rangeOfCharacterFromSet:notDigits].location == NSNotFound)
    {
        shouldChange = YES;
    }
    
    return shouldChange;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    [textField resignFirstResponder];
    
    if (textField == _limitTextField) {
        [self.presenter setLimitString:_limitTextField.text];
    }
    else if (textField == _incrementTextField) {
        [self.presenter setIncrementString:_incrementTextField.text];
    }
    
    return NO;
}

#pragma mark - SettingsViewProtocol

- (void)setIncrement:(NSString *)incrementString;
{
    _incrementTextField.text = incrementString;
}

- (void)setLimit:(NSString *)limitString;
{
    _limitTextField.text = limitString;
}


@end
