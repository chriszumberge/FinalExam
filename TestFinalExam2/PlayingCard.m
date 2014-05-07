//
//  PlayingCard.m
//  Practice1
//
//  Created by Christopher Zumberge on 2/17/14.
//  Copyright (c) 2014 Christopher Zumberge. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;

-(void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit])
    {
        _suit = suit;
    }
    return;
}

-(void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank])
    {
        _rank = rank;
    }
    return;
}

-(NSString *)contents
{
    NSArray *cardRankStrings = [PlayingCard rankStrings];
    return [cardRankStrings[self.rank] stringByAppendingString:self.suit];
}

-(NSString *)suit
{
    return _suit ? _suit : @"?";
}

+(NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger)maxRank
{
    return [[self rankStrings] count] - 1;
}

+(NSArray *)validSuits
{
    return @[@"♥",@"♣",@"♦",@"♠"];
}

+(PlayingCard*)playingCardFromCard:(Card *)card
{
    PlayingCard *pCard = [[PlayingCard alloc] init];
    NSString *cardContents = [[NSString alloc] initWithString:card.contents];
    NSString *buffer = [cardContents substringFromIndex:2];
    // If substring from second index is null, then it's a single digit number because
    // the string is only 2 characters long
    NSLog(@"Buffer: %@", buffer);
    if ([buffer isEqualToString:@""])
    {
        NSArray *rStrings = [self rankStrings];
        NSString *sRank = [cardContents substringToIndex:1];
        pCard.rank = [rStrings indexOfObject:sRank];
        pCard.suit = [cardContents substringFromIndex:1];
    }
    // not nil, then buffer is the suit because it's the last char
    else
    {
        //pCard.rank = [[cardContents substringToIndex:2] integerValue];
        NSArray *rSrings = [self rankStrings];
        NSString *sRank = [cardContents substringToIndex:2];
        pCard.rank = [rSrings indexOfObject:sRank];
        pCard.suit = buffer;
    }
    return pCard;
}

@end
