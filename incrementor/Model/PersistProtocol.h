//
//  CounterPersistProtocol.h
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-26.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PersistProtocol <NSObject>

+ (instance)newWithUserDefaults:(NSUserDefaults *)userDefaults
              persistingnObject:(NSObject<NSCoding>*)object;

@end
