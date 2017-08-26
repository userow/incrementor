//
//  SettingsViewProtocol.h
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-26.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

/**
 Протокол View - методы, предоставляющиеся Presenter-у
 */
@protocol SettingsViewProtocol <NSObject>


/**
 задание Инкремента для отображения на View

 @param incrementString строка с Инкрементом
 */
- (void)setIncrement:(NSString *)incrementString;


/**
 задание Граничного Значения для отображения на View

 @param limitString строка с Граничным Значением
 */
- (void)setLimit:(NSString *)limitString;

@end
