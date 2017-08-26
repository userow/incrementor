//
//  CounterPresenter.m
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-23.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import "CounterPresenter.h"

/*
 class CounterPresenter : CounterViewPresenter {
 
 unowned let view: CounterView
 let model: Counter
 
 required init(view: CounterView, model: Counter) {
 self.view = view
 self.model = model
 }
 
 func showCount() {
 let countStr : String = "\(model.current)"
 
 self.view.setCount(countString: countStr)
 }
 
 func countCounter() {
 self.model.count()
 self.showCount()
 }
 }
 */
@interface CounterPresenter ()

@property (nonatomic, weak) UIViewController<CounterViewProtocol> *view;
@property (nonatomic, strong) Counter *model;

@end


@implementation CounterPresenter

- (instancetype)initWithView:(id)view model:(Counter *)counter {
    if (self = [super init]) {
        _model = counter;
        _view = view;
    }
    
    return self;
}

- (void)showCount {
    NSString *countString = [NSString stringWithFormat:@"%ld",
                             [self.model getCount]];
    
    [_view setCount:countString];
}

- (void)onCountButtonClicked {
    [self.model doStep];
    [self showCount];
}

- (void)onSettingsButtonClicked {
    //TODO: Router interaction
}

@end
