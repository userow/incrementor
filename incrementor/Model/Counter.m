//
//  Counter.m
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-19.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import "Counter.h"

#import "PersistService.h"

@interface Counter ()

//@property (nonatomic, strong, readonly) NSUserDefaults *userDefaults;

@property (nonatomic, strong) PersistService *saveService;

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

@end

@implementation Counter

#pragma mark - initializers and constructors

- (instancetype)init {
    if (self = [super init]) {
//        _userDefaults = [NSUserDefaults standardUserDefaults];
        
        _incrementValue = 1;
        _currentValue = 0;
        _limitValue = NSIntegerMax;
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
                                           limit:NSIntegerMax
                                         current:0];
    
    return cnt;
}


#pragma mark - getters
- (NSInteger)getCount;
{
    return _currentValue;
}

- (NSInteger)getIncrement;
{
    return _incrementValue;
}

- (NSInteger)getLimit;
{
    return _limitValue;
}

#pragma mark - setters

- (void)setCount:(NSInteger)count;
{
    _currentValue = count;
}

- (void)setIncrement:(NSInteger)increment;
{
    _incrementValue = increment;
}

- (void)setLimit:(NSInteger)limit;
{
    _limitValue = limit;
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

- (NSInteger)doStep {
    if (NSIntegerMax - _currentValue > _incrementValue &&
        _currentValue + _incrementValue < _limitValue)
    {
        _currentValue += _incrementValue;
        
    } else {
        _currentValue = 0;
    }
    
    [self saveCounter];
    
    return _currentValue;
}

- (void)doReset;
{
    self.currentValue = 0;
    
    [self saveCounter];
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
    // ??? is it right ???
    if (self = [super init])
    {
//        _userDefaults = [NSUserDefaults standardUserDefaults];
        
        _currentValue   = [aDecoder decodeIntegerForKey:@"_currentValue"];
        _incrementValue = [aDecoder decodeIntegerForKey:@"_incrementValue"];
        _limitValue     = [aDecoder decodeIntegerForKey:@"_limitValue"];
    }
    
    return self;
}

//TODO: вывести в отдельный метод (внешний)

#pragma mark - saving to / loading frоm NSUserDefaults
/**
 сохраняет Counter в userDefaults
 */
- (void)saveCounter;
{
    NSLog(@"Saving Counter...");
    
    if (!self.saveService) {
        _saveService = [PersistService newWithUserDefaults:[NSUserDefaults standardUserDefaults]
                                                       key:@"CURRENT_SAVED_COUNTER"
                                         persistingnObject:self];
    }
    
    [_saveService saveObject];
}

/**
 загружает Counter из userDefaults
 */
+ (instancetype)loadCounter;
{
    NSLog(@"Loading Counter...");
 
    Counter *object = [Counter new];
              
    if (!object.saveService) {
        object.saveService = [PersistService newWithUserDefaults:[NSUserDefaults standardUserDefaults]
                                                             key:@"CURRENT_SAVED_COUNTER"
                                               persistingnObject:object];
    }
    
    object = (Counter *)[object.saveService loadObject];

    return object;
}

@end
