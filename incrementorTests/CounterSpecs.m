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
        
        expect([counter getCount]).to.equal(0);
        
        expect([counter getIncrement]).to.equal(1);
        
        expect([counter getLimit]).to.equal(NSIntegerMax);
        
    });
    
    
    it(@"can be constructed", ^{
        Counter *cnt = [Counter counterWithIncrement:1
                                               limit:3
                                             current:0];
        
        expect([cnt getCount]).to.equal(0);
        expect([cnt getIncrement]).to.equal(1);
        expect([cnt getLimit]).to.equal(3);
    });
    
    it(@"can be incremented", ^{
        Counter *cnt = [Counter counterWithIncrement:1
                                               limit:3
                                             current:0];
        
        [cnt doStep];
        
        expect([cnt getCount]).to.equal(1);
    });
    
    it(@"can be reseted", ^{
        Counter *cnt = [Counter counterWithIncrement:1
                                               limit:3
                                             current:0];
        
        [cnt doStep];
        
        expect([cnt getCount]).to.equal(1);
        
        [cnt doReset];
        
        expect([cnt getCount]).to.equal(0);
    });
    
    it (@"Counter curreentValue should be 0 on reaching limit", ^{
        Counter *cnt = [Counter counterWithIncrement:1
                                               limit:3
                                             current:2];
        
        expect([cnt getCount]).to.equal(2);
        
        [cnt doStep];
        
        expect([cnt getCount]).to.equal(0);
    });
    
    it (@"can be equal", ^{
        Counter *cnt1 = [Counter counterWithIncrement:1
                                                limit:3
                                              current:2];
        
        Counter *cnt2 = [Counter counterWithIncrement:1
                                                limit:3
                                              current:1];
        expect(cnt1).notTo.equal(cnt2);
        
        [cnt2 doStep];
        
        expect(cnt1).to.equal(cnt2);
    });

    it (@"can be equal - 2", ^{
        Counter *cnt1 = [Counter counterWithIncrement:1
                                                limit:3
                                              current:2];
        
        Counter *cnt2 = [Counter new];
    
        [cnt2 setIncrement:1];
        [cnt2 setLimit:3];
        [cnt2 setCount:1];
        
        expect(cnt1).notTo.equal(cnt2);
        
        [cnt2 doStep];
        
        expect(cnt1).to.equal(cnt2);
    });
    it (@"have good description", ^{
        Counter *cnt = [Counter counterWithIncrement:1
                                               limit:3
                                             current:2];
        
        expect([cnt description]).to.equal(@"current: 2, increment: 1, limit: 3");
    });
        
    it (@"can be serialized and deserialized", ^{
        Counter *cnt = [Counter new];
        [cnt setIncrement:1];
        [cnt setLimit:3];
        [cnt setCount:1];
        
        NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:cnt];
        
        Counter *unarchived = (Counter *)[NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
        
        expect(cnt).to.equal(unarchived);
    });
    
    
    it (@"can save to and load from user defaults", ^{
        Counter *cnt = [Counter counterWithIncrement:1
                                               limit:3
                                             current:2];
        
        [cnt saveCounter];
        
        Counter *cnt2 = [Counter loadCounter];
        
        expect(cnt).to.equal(cnt2);
    });
});

SpecEnd
