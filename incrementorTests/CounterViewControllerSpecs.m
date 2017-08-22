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
    
    __block CounterViewController *_vc;
    
    beforeEach(^{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UINavigationController *nav = [storyboard instantiateInitialViewController];
        _vc = (CounterViewController *)[nav visibleViewController];
        
        expect(_vc).to.beInstanceOf([CounterViewController class]);
        
        //for viewDidLoad execution
        UIView *view = _vc.view;
        expect(view).notTo.beNil();
    });
    
    it(@"can be loaded, instance of CounterVC", ^{
        expect(_vc).notTo.beNil();
        expect(_vc).to.beInstanceOf([CounterViewController class]);
    });
    
    it(@"should have outlets - current label", ^{
        expect([_vc currentVlaueLabel]).notTo.beNil();
        expect([_vc currentVlaueLabel]).to.beInstanceOf([UILabel class]);
    });
    
    it(@"should have outlets - settings bar button", ^{
        expect(_vc.settingsBarButton).notTo.beNil();
        expect(_vc.settingsBarButton).to.beInstanceOf([UIBarButtonItem class]);
    });
    
    it(@"should have outlets - increment button", ^{
        expect(_vc.incrementButton).notTo.beNil();
        expect(_vc.incrementButton).to.beInstanceOf([UIButton class]);
    });
    
    
    it(@"should wire up increment button to action", ^{
        UIButton *button = _vc.incrementButton;
        NSArray *actions = [button actionsForTarget:_vc forControlEvent:UIControlEventTouchUpInside];
        
        expect(actions[0]).to.equal(@"incrementTapped:");
    });
    
    it(@"should wire up Settings button to action", ^{
        UIBarButtonItem *button = _vc.settingsBarButton;
        NSString *action = NSStringFromSelector(button.action);
        
        expect(action).to.equal(@"settingsTapped:");
    });
});


SpecEnd
