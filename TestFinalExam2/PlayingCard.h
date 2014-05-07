//
//  PlayingCard.h
//  Practice1
//
//  Created by Christopher Zumberge on 2/17/14.
//  Copyright (c) 2014 Christopher Zumberge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray *)validSuits;
+(NSArray *)rankStrings;
+(NSUInteger)maxRank;
+(PlayingCard*)playingCardFromCard:(Card *)card;

@end
