//
//  ControllerViewProtocol.h
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-22.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//


/**
 Протокол View - методы, предоставляющиеся Presenter-у
 */
@protocol CounterViewProtocol <NSObject>


- (void)setCount:(NSString *)countString;

@end
