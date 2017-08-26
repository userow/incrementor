//
//  NoPasteTextField.m
//  incrementor
//
//  Created by Pavel Wasilenko on 2017-08-26.
//  Copyright © 2017 Paul Wasilenko. All rights reserved.
//

#import "NoPasteTextField.h"

@implementation NoPasteTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(paste:))
    {
        return NO;
    }
    
    return YES;
}


@end
