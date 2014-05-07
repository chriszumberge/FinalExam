//
//  Deck.h
//  Practice1
//
//  Created by Christopher Zumberge on 2/16/14.
//  Copyright (c) 2014 Christopher Zumberge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;
-(Card *)drawRandomCard;
@end
