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
    it(@"can be initialized with default values", ^{
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
    
    it (@"Counter curreentValue should be 0 on reaching limit", ^{
        Counter *cnt = [Counter counterWithIncrement:1
                                               limit:3
                                             current:2];
        
        expect(cnt.currentValue).to.equal(2);
        
        [cnt count];
        
        expect(cnt.currentValue).to.equal(0);
    });
    
    it (@"can be equal", ^{
        Counter *cnt1 = [Counter counterWithIncrement:1
                                                limit:3
                                              current:2];
        
        Counter *cnt2 = [Counter counterWithIncrement:1
                                                limit:3
                                              current:1];
        expect(cnt1).notTo.equal(cnt2);
        
        [cnt2 count];
        
        expect(cnt1).to.equal(cnt2);
    });

    it (@"can be equal - 2", ^{
        Counter *cnt1 = [Counter counterWithIncrement:1
                                                limit:3
                                              current:2];
        
        Counter *cnt2 = [Counter new];
    
        cnt2.incrementValue = 1;
        cnt2.limitValue = 3;
        cnt2.currentValue = 1;
        
        expect(cnt1).notTo.equal(cnt2);
        
        [cnt2 count];
        
        expect(cnt1).to.equal(cnt2);
    });
    it (@"have good description", ^{
        Counter *cnt = [Counter counterWithIncrement:1
                                               limit:3
                                             current:2];
        
        expect([cnt description]).to.equal(@"current: 2, increment: 1, limit: 3");
    });
        
    it (@"can be serialied and deserialized", ^{
        Counter *cnt = [Counter new];
        cnt.incrementValue = 1;
        cnt.limitValue = 3;
        cnt.currentValue = 2;
        
        NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:cnt];
        
        Counter *unarchived = (Counter *)[NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
        
//        BOOL equal = [cnt isEqual:unarchived];
        
        expect(cnt).to.equal(unarchived);
    });
});

SpecEnd
