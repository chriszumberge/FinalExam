//
//  Card.h
//  Practice1
//
//  Created by Christopher Zumberge on 2/16/14.
//  Copyright (c) 2014 Christopher Zumberge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic) BOOL chosen;
@property (nonatomic) BOOL matched;

-(BOOL)match:(Card *)cardToMatch;

@end
