//
//  CounterViewPresenterProtocol.h
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-22.
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
#import "CounterViewProtocol.h"
#import "Counter.h"

@protocol CounterViewPresenterProtocol <NSObject>


/**
 Инициализатор презентора

 @param view - вью
 @param counter - модель
 @return презентор
 */
- (instancetype)initWithView:(UIViewController<CounterViewProtocol> *)view
                       model:(Counter *)counter;

/**
 отобразить на View текущее состояние счётчика
 */
- (void)showCount;


/**
 передать модели, что она должна инкрементировться
 */
- (void)countCounter;

@end
