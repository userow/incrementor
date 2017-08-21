//
//  Counter.m
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-19.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import "Counter.h"

@interface Counter ()

//@property (nonatomic, strong, readonly) NSUserDefaults *userDefaults;

@end

@implementation Counter

#pragma mark - initializers and constructors

- (instancetype)init {
    if (self = [super init]) {
//        _userDefaults = [NSUserDefaults standardUser  Defaults];
        
        _incrementValue = 1;
        _currentValue = 0;
        _limitValue = 0;
    }
    
    return self;
}

+ (instancetype)counterWithIncrement:(NSInteger)increment
                               limit:(NSInteger)limit
                             current:(NSInteger)current
{
    Counter *cnt = [Counter new];
    
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

#pragma mark - description

- (NSString *)description {
    NSString *desc = [NSString stringWithFormat:@"current: %ld, increment: %ld, limit: %ld",
                      (long)_currentValue,
                      (long)_incrementValue,
                      (long)_limitValue];
    
    return desc;
}

#pragma mark - equality

- (BOOL)isEqual:(id)object
{
    BOOL equal = NO;
    
    if ([object isKindOfClass:[Counter class]]) {
        Counter *cn = (Counter *)object;
        
        if (cn.currentValue == _currentValue &&
            cn.incrementValue == _incrementValue &&
            cn.limitValue == _limitValue)
        {
            equal = YES;
        }
    }
    
    return equal;
}

#pragma mark - operations

- (NSInteger)count {
    self.currentValue += self.incrementValue;
    
    if (self.limitValue && self.currentValue >= self.limitValue) {
        self.currentValue = 0;
    }
    
    return self.currentValue;
}

- (void)reset;
{
    self.currentValue = 0;
}

#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder;
{
    [aCoder encodeInteger:_currentValue   forKey:@"_currentValue"];
    [aCoder encodeInteger:_incrementValue forKey:@"_incrementValue"];
    [aCoder encodeInteger:_limitValue     forKey:@"_limitValue"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder;
{
    
    if (self = [super init])
    {
//        _userDefaults = [NSUserDefaults standardUserDefaults];
        
        _currentValue   = [aDecoder decodeIntegerForKey:@"_currentValue"];
        _incrementValue = [aDecoder decodeIntegerForKey:@"_incrementValue"];
        _limitValue     = [aDecoder decodeIntegerForKey:@"_limitValue"];
    }
    
    return self;
}

/*
 #pragma mark - saving to / loading frоm NSUserDefaults
 - (void)save;
 {
 NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:self];
 [[NSUserDefaults standardUserDefaults] setObject:encodedObject forKey:CURRENT_USER_KEY];
 [[NSUserDefaults standardUserDefaults] synchronize];
 }
 
 + (BUUser *)loadUser;
 {
 DDLogInfo(@"Loading User...");
 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
 NSData *encodedObject = [defaults objectForKey:CURRENT_USER_KEY];
 BUUser *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
 
 return object;
 }
 */


@end
