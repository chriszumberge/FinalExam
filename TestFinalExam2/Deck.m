//
//  Deck.m
//  Practice1
//
//  Created by Christopher Zumberge on 2/16/14.
//  Copyright (c) 2014 Christopher Zumberge. All rights reserved.
//

#import "Deck.h"
#import "Card.h"
@interface Deck ()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation Deck

-(NSMutableArray *)cards
{
    if(!_cards)
    {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop)
    {
        [self.cards insertObject:card atIndex:0];
    }
    else
    {
        [self.cards addObject:card];
    }
}

-(void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

-(Card *)drawRandomCard
{
    Card *drawCard = nil;
    if ([self.cards count])
    {
        unsigned index = arc4random() % [self.cards count];
        drawCard = [self.cards objectAtIndex:index];
        [self.cards removeObject:drawCard];
        NSLog(@"%@", drawCard.contents);
    }
    return drawCard;
}
@end
