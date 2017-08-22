//
//  ViewControllerSpecs.m
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-21.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import <Specta.h>
#define EXP_SHORTHAND
#import <Expecta.h>
#import <OCMock.h>

#import "CounterViewController.h"

SpecBegin(CounterViewControllerSpec)

describe(@"CounterViewController", ^{
    
    __block UIViewController *_vc;
    
    beforeEach(^{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UINavigationController *nav = [storyboard instantiateInitialViewController];
        _vc = [nav visibleViewController];
        UIView *view = _vc.view;
        expect(view).notTo.beNil();
    });
    
    it(@"can be loaded", ^{
        expect(_vc).notTo.beNil();
        expect(_vc).to.beInstanceOf([CounterViewController class]);
    });
    
    it(@"should have outlets - current label", ^{
        expect(_vc).to.beInstanceOf([CounterViewController class]);
   
        if ([_vc isMemberOfClass:[CounterViewController class]])
        {
            CounterViewController *cvc = (CounterViewController*)_vc;
            
            expect([cvc currentVlaueLabel]).notTo.beNil();
            expect([cvc currentVlaueLabel]).to.beInstanceOf([UILabel class]);
        }
    });
    
    it(@"should have outlets - settings bar button", ^{
        expect(_vc).to.beInstanceOf([CounterViewController class]);
        
        if ([_vc isMemberOfClass:[CounterViewController class]])
        {
            CounterViewController *cvc = (CounterViewController*)_vc;
            
            expect(cvc.settingsBarButton).notTo.beNil();
            expect(cvc.settingsBarButton).to.beInstanceOf([UIBarButtonItem class]);
        }
    });
    
    it(@"should have outlets - increment button", ^{
        expect(_vc).to.beInstanceOf([CounterViewController class]);
        
        if ([_vc isMemberOfClass:[CounterViewController class]])
        {
            CounterViewController *cvc = (CounterViewController*)_vc;
       
            expect(cvc.incrementButton).notTo.beNil();
            expect(cvc.incrementButton).to.beInstanceOf([UIButton class]);
        }
    });
    
    it(@"should have outlets - current label", ^{
        ;
    });
       
});


SpecEnd
