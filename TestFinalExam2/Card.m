//
//  Card.m
//  Practice1
//
//  Created by Christopher Zumberge on 2/16/14.
//  Copyright (c) 2014 Christopher Zumberge. All rights reserved.
//

#import "Card.h"

@implementation Card

-(BOOL)match:(Card *)cardToMatch
{
    if ([cardToMatch.contents isEqualToString:self.contents])
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

@end
