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
 текущее значение счётчика
 */
@property (assign) NSInteger currentValue;

/**
 инкремент счётчика
 */
@property (assign) NSInteger incrementValue;


/**
 граничное значение - по достижении которого счётчик сбрасывается до 0. при граничном значении 0 - граничное значение не проверяется, счётчик не сбрасывается.
 */
@property (assign) NSInteger limitValue;


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

#pragma mark - operations

/**
 инкрементирование счётчика
 
 @return инерементированное значение счётчика
 */
- (NSInteger)count;

/**
 сброс значения счётчика
 */
- (void)reset;

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
