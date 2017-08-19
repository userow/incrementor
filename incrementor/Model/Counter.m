//
//  Counter.m
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-19.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import "Counter.h"

@implementation Counter

- (instancetype)init {
    if (self = [super init]) {
        self.incrementValue = 1;
        self.currentValue = 0;
        self.limitValue = 0;
    }
    
    return self;
}

+ (instancetype)counterWithIncrement:(NSInteger)increment
                               limit:(NSInteger)limit
                             current:(NSInteger)current
{
    Counter *cnt = [[Counter alloc] init];
    
    cnt.incrementValue = increment;
    cnt.limitValue = limit;
    cnt.currentValue = current;
    
    return cnt;
}

+ (instancetype)counterWithIncrement:(NSInteger)increment
                               limit:(NSInteger)limit
{
    Counter *cnt = [Counter counterWithIncrement:increment
                                           limit:limit
                                         current:0];
    
    return cnt;
}
                    
+ (instancetype)counterWithIncrement:(NSInteger)increment
{
    Counter *cnt = [Counter counterWithIncrement:increment
                                           limit:0
                                         current:0];
    
    return cnt;
}
                    
- (NSInteger)count {
    self.currentValue += self.incrementValue;
    
    if (self.limitValue && self.currentValue >= self.limitValue) {
        self.currentValue = 0;
    }
    
    return self.currentValue;
}

- (void) reset;
{
    self.currentValue = 0;
}


@end
