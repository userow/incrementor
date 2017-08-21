//
//  Counter.h
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-19.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Counter : NSObject <NSCoding>

/**
 текущее значение счётчика
 */
@property (assign) NSInteger currentValue;

/**
 инкремент счётчика
 */
@property (assign) NSInteger incrementValue;


/**
 граничное значение - по достижении которого счётчик сбрасывается до 0
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
 @param limit граничное значение
 @param current текущее значение
 @return Counter
 */
+ (instancetype)counterWithIncrement:(NSInteger)increment
                               limit:(NSInteger)limit
                             current:(NSInteger)current;


/**
 сброс значения счётчика
 */
- (void)reset;


/**
 инкрементирование счётчика

 @return инерементированное значение счётчика
 */
- (NSInteger)count;

//TODO: NSCoding

//TODO: Hash

@end
