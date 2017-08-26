//
//  SettingsViewPresenterProtocol.h
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-26.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

/*
 protocol CounterViewPresenter {
     init(view: CounterView, model: Counter)
     func showCount()
     func countCounter()
 }
 */

#import <UIKit/UIKit.h>
#import "SettingsViewProtocol.h"
#import "Counter.h"

@protocol SettingsPresenterProtocol <NSObject>


/**
 Инициализатор презентора

 @param view - вью
 @param counter - модель
 @return презентор
 */
- (instancetype)initWithView:(id<SettingsViewProtocol>)view
                       model:(Counter *)counter;

/**
 отобразить на View значение Инкремента
 */
- (void)showIncrement;

/**
 отобразить на View  Граничное Значение 
 */
- (void)showLimit;

/**
 View меняет значение Инкремента
 */
- (void)setIncrementString:(NSString *)incrementString;

/**
 View меняет Граничное Значение
 */
- (void)setLimitString:(NSString *)limitString;

/**
 передать модели, что она должна сбросить текущее состояние
 */
- (void)doResetCounter;

@end
