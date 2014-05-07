//
//  PlayingCardDeck.m
//  Practice1
//
//  Created by Christopher Zumberge on 2/17/14.
//  Copyright (c) 2014 Christopher Zumberge. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface Deck()
-(Card *)drawRandomCard;
@end

@implementation PlayingCardDeck

-(id)init
{
    self = [super init];
    if (self)
    {
        for (NSString *suit in [PlayingCard validSuits])
        {
            for (NSUInteger i = 1; i <[PlayingCard maxRank]; i++)
            {
                PlayingCard *newCard = [[PlayingCard alloc] init];
                newCard.rank = i;
                newCard.suit = suit;
                [self addCard:newCard];
            }
        }
    }
    return self;
}

@end
