//
//  Counter.h
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-19.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Counter : NSObject <NSCoding>

#pragma mark - initializers and constructors
/**
 initializer
 
 @return Counter
 */
- (instancetype)init;


/**
 constructor

 @param increment инкремент
 @return Counter
 */
+ (instancetype)counterWithIncrement:(NSInteger)increment;

/**
 constructor
 
 @param increment инкремент
 @param limit граничное значение
 @return Counter
 */
+ (instancetype)counterWithIncrement:(NSInteger)increment
                               limit:(NSInteger)limit;

/**
 constructor

 @param increment инкремент
 @param limit граничное значение. 0 - граничное значение не проверяется, счётчик не сбрасывается.
 @param current текущее значение счётчика
 @return Counter
 */
+ (instancetype)counterWithIncrement:(NSInteger)increment
                               limit:(NSInteger)limit
                             current:(NSInteger)current;

#pragma mark - getters

- (NSInteger)getCount;

- (NSInteger)getIncrement;

- (NSInteger)getLimit;

#pragma mark - setters

- (void)setCount:(NSInteger)count;

- (void)setIncrement:(NSInteger)increment;

- (void)setLimit:(NSInteger)limit;

#pragma mark - operations

/**
 инкрементирование счётчика
 
 @return инерементированное значение счётчика
 */
- (NSInteger)doStep;

/**
 сброс значения счётчика
 */
- (void)doReset;

//TODO: Hash ?

#pragma mark - saving to / loading frоm NSUserDefaults
/**
 сохраняет Counter в userDefaults
 */
- (void)saveCounter;

/**
 загружает Counter из userDefaults
 */
+ (instancetype)loadCounter;

@end
