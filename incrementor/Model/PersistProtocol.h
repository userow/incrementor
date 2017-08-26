//
//  CounterPersistProtocol.h
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-26.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PersistProtocol <NSObject>

+ (instancetype)newWithUserDefaults:(NSUserDefaults *)userDefaults
                                key:(NSString *)key
                  persistingnObject:(NSObject<NSCoding>*)object;

- (void)saveObject;

- (NSObject<NSCoding> *)loadObject;

@end
