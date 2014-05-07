//
//  CardMatchingGame.h
//  Test1b
//
//  Created by Christopher Zumberge on 2/26/14.
//  Copyright (c) 2014 Christopher Zumberge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject
{
    
}

@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic, readonly) NSInteger *score;

- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@end
