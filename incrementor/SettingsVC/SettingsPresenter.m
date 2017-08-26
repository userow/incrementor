//
//  SettingsPresenter.m
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-26.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import "SettingsPresenter.h"

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
@interface SettingsPresenter ()

@property (nonatomic, weak) id<SettingsViewProtocol> view;
@property (nonatomic, strong) Counter *model;

@end


@implementation SettingsPresenter

- (instancetype)initWithView:(id<SettingsViewProtocol>)view model:(Counter *)counter {
    if (self = [super init]) {
        _model = counter;
        _view = view;
    }
    
    return self;
}

- (void)showIncrement {
    NSString *countString = [NSString stringWithFormat:@"%ld",
                             [self.model getIncrement]];
    
    [_view setIncrement:countString];
}

- (void)showLimit {
    NSString *limitString = [NSString stringWithFormat:@"%ld",
                             [self.model getLimit]];
    [_view setLimit:limitString];
}

- (void)doResetCounter {
    [self.model doReset];
}

- (void)setIncrementString:(NSString *)incrementString;
{
    NSNumber *value = [self numberFromString:incrementString];
    
    //TODO: проверка
    if (value.integerValue > 0 &&
        value.integerValue < NSIntegerMax)
    {
        ;
    }
}

- (void)setLimitString:(NSString *)limitString
{
    NSNumber *value = [self numberFromString:limitString];
    
    //TODO: проверка
    if (value.integerValue > 0 &&
        value.integerValue < NSIntegerMax)
    {
        ;
    }
}

- (NSNumber *)numberFromString:(NSString *)numberString;
{
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * number = [formatter numberFromString:numberString];
    
    return number;
}

@end
