//
//  CounterSpecs.m
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-19.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import <Specta.h>
#define EXP_SHORTHAND
#import <Expecta.h>

#import "Counter.h"

SpecBegin(CounterSpecs)

/*
 1) counter
 */

describe(@"Counter", ^{
    it(@"can be inited with default values", ^{
        Counter *counter = [[Counter alloc] init];
        
        expect(counter.currentValue).to.equal(0);
        
        expect(counter.incrementValue).to.equal(1);
        
        expect(counter.limitValue).to.equal(0);
        
    });
    
    
    it(@"can be constructed", ^{
        Counter *cnt = [Counter counterWithIncrement:1
                                               limit:3
                                             current:0];
        
        expect(cnt.currentValue).to.equal(0);
    });
    
    it(@"can be incremented", ^{
        Counter *cnt = [Counter counterWithIncrement:1
                                               limit:3
                                             current:0];
        
        [cnt count];
        
        expect(cnt.currentValue).to.equal(1);
    });
    
    it(@"can be reseted", ^{
        Counter *cnt = [Counter counterWithIncrement:1
                                               limit:3
                                             current:0];
        
        [cnt count];
        
        expect(cnt.currentValue).to.equal(1);
        
        [cnt reset];
        
        expect(cnt.currentValue).to.equal(0);
    });
    
    it (@"can be nulified on reaching limit", ^{
        Counter *cnt = [Counter counterWithIncrement:1
                                               limit:3
                                             current:2];
        
        expect(cnt.currentValue).to.equal(2);
        
        [cnt count];
        
        expect(cnt.currentValue).to.equal(0);
    });
});

SpecEnd
