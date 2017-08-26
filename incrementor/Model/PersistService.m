//
//  PersistService.m
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-26.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

static NSString *CURRENT_PREFIX = @"CURRENT_SAVED_";

#import "PersistService.h"

@interface PersistService ()

@property (nonatomic, strong) NSUserDefaults *userDefaults;
@property (nonatomic, strong) NSObject<NSCoding> *servicedObject;
@property (nonatomic, strong) NSString *key;

@end

@implementation PersistService

- (instancetype)init;
{
    if (self = [super init])
    {
        ;
    }
    return self;
}

+(instancetype)newWithUserDefaults:(NSUserDefaults *)userDefaults
                               key:(NSString *)key
                 persistingnObject:(NSObject<NSCoding> *)object;
{
    PersistService *service = [[PersistService alloc] init];
    
    service.userDefaults = userDefaults;
    service.servicedObject = object;
    service.key = key;
    
    return service;
}

- (void)saveObject;
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:_servicedObject];
//    NSString *key = [CURRENT_PREFIX stringByAppendingString:NSStringFromClass([_servicedObject class])];
    [_userDefaults setObject:encodedObject forKey:_key];
    [_userDefaults synchronize];
}

- (NSObject<NSCoding> *)loadObject;
{
//    NSString *key = [CURRENT_PREFIX stringByAppendingString:NSStringFromClass([_servicedObject class])];
    
    NSData *encodedObject = [_userDefaults objectForKey:_key];
    
    NSObject<NSCoding> *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    
    return object;
}

@end
