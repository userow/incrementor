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

/*
 @property (weak, nonatomic) IBOutlet UIBarButtonItem *settingsBarButton;
 @property (weak, nonatomic) IBOutlet UIButton *countButton;
 
 @property (strong, nonatomic) id<CounterPresenterProtocol> presenter;
 */

SpecBegin(CounterViewControllerSpec)

describe(@"CounterViewController", ^{
    
    __block CounterViewController *_vc;
    
    beforeEach(^{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        _vc = [storyboard instantiateInitialViewController];
        
        expect(_vc).to.beInstanceOf([CounterViewController class]);
        
        //for viewDidLoad execution
        UIView *view = _vc.view;
        expect(view).notTo.beNil();
    });
    
    it(@"should have outlets - settings bar button", ^{
        expect(_vc.settingsBarButton).notTo.beNil();
        expect(_vc.settingsBarButton).to.beInstanceOf([UIBarButtonItem class]);
    });
    
    it(@"should have outlets - count button", ^{
        expect(_vc.countButton).notTo.beNil();
        expect(_vc.countButton).to.beInstanceOf([UIButton class]);
    });
    
    
    it(@"should wire up increment button to action", ^{
        UIButton *button = _vc.countButton;
        NSArray *actions = [button actionsForTarget:_vc forControlEvent:UIControlEventTouchUpInside];
        
        expect(actions[0]).to.equal(@"countButtonTapped:");
    });
    
    it(@"should wire up Settings button to action", ^{
        UIBarButtonItem *button = _vc.settingsBarButton;
        NSString *action = NSStringFromSelector(button.action);
        
        expect(action).to.equal(@"settingsBarButtonTapped:");
    });
});


SpecEnd
