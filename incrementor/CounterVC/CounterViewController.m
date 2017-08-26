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
    [self.presenter onCountButtonClicked];
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
