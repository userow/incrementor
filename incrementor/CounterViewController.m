//
//  ViewController.m
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-19.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import "CounterViewController.h"

@interface CounterViewController ()

@end

@implementation CounterViewController

#pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - actions

- (IBAction)countButtonTapped:(id)sender;
{
    ;
}

- (IBAction)settingsButtonTapped:(id)sender;
{
    ;
}

#pragma mark - CounterViewProtocol

- (void)setCount:(NSString *)countString;
{
    [self.countButton setTitle:countString forState:UIControlStateNormal];
    [self.countButton setTitle:countString forState:UIControlStateSelected];
    [self.countButton setTitle:countString forState:UIControlStateHighlighted];
}

@end
