//
//  Test1bViewController.m
//  Test1b
//
//  Created by Christopher Zumberge on 2/26/14.
//  Copyright (c) 2014 Christopher Zumberge. All rights reserved.
//

#import "Test1bViewController.h"
#import "CardMatchingGame.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "Card.h"

@interface Test1bViewController ()

@end

@implementation Test1bViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    PlayingCardDeck *playingDeck = [[PlayingCardDeck alloc] init];

	self.game = [[CardMatchingGame alloc] initWithCardCount:16 usingDeck:playingDeck];
    [self collectButtons];
    self.flipBoolArray = [[NSMutableArray alloc] initWithObjects:@"0", @"0", @"0", @"0", @"0",
                          @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", nil];
    self.scoreValue.text = @"0";
    NSLog(@"%@", @"Created");
    NSLog(@"%lu", (unsigned long)[self.game.cards count]);
    
    self.contents1Label.text = @" ";
    self.contents2Label.text = @" ";
}

- (void)collectButtons
{
    NSArray *buttons = [[NSArray alloc] initWithObjects:self.button0, self.button1, self.button2,
                        self.button3, self.button4, self.button5, self.button6, self.button7,
                        self.button8, self.button9, self.button10, self.button11, self.button12,
                        self.button13, self.button14, self.button15, nil];
    self.cardCollection = [[NSMutableArray alloc] init];
    [self.cardCollection addObjectsFromArray:buttons];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)applicationDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}

- (void)changeScore:(int)changeAmt {
    int value = [self.scoreValue.text intValue];
    int newValue = value + changeAmt;
    NSLog(@"value: %d, changeamt: %d, newValue: %d", value, changeAmt, newValue);
    self.scoreValue.text = [NSString stringWithFormat:@"%d", newValue];
}

- (IBAction)flipCard:(id)sender {
    NSUInteger index = [self.cardCollection indexOfObject:sender];
    NSLog(@"%@", self.flipBoolArray[index]);
    // If it's already flipped
    if ([self.flipBoolArray[index] isEqualToString:@"1"])
    {
        [sender setTitle:@" " forState:UIControlStateNormal];
        UIImage *background = [UIImage imageNamed:@"muhback.png"];
        [sender setBackgroundImage:background forState:UIControlStateNormal];
        self.flipBoolArray[index] = @"0";
        self.oneFlipped = false;
        self.cardToMatch = @"";
        self.buttonToMatch = nil;
        self.contents1Label.text = @" ";
    }
    // If it's not flipped
    else
    {
        // Lose a point for flipping
        [self changeScore:-1];
        
        NSString *cardContents = [[NSString alloc] init];
        Card *card = [self.game cardAtIndex:index];
        cardContents = card.contents;
        [sender setTitle:cardContents forState:UIControlStateNormal];
        [sender setBackgroundImage:nil forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor whiteColor]];
        self.flipBoolArray[index] = @"1";
        // if there's already one flipped, do matching
        if (self.oneFlipped)
        {
            BOOL matched = [self matchCard:card withCard:self.matchCard];
            NSLog(@"matched: %d", (int)matched);
            self.contents2Label.text = cardContents;
            if (matched)
            {
                self.oneFlipped = false;
                // lock the cards
                [self DisableUIControl:sender];
                [self DisableUIControl:self.buttonToMatch];
                self.contents1Label.text = @" ";
                self.contents2Label.text = @" ";
            }
            else
            {
                // sleep to let user see the card they flipped
                self.oneFlipped = false;
                for (int i = 0; i < self.flipBoolArray.count; i++)
                {
                    if ([self.flipBoolArray[i] isEqualToString:@"1"])
                    {
                        // flip it back on it's back
                        [self FlipFaceDown:sender withIndex:index];
                    }
                }
            }
        }
        // none flipped yet
        else
        {
            self.contents1Label.text = cardContents;
            self.contents2Label.text = @" ";
            self.oneFlipped = true;
            self.matchCard = card;
            self.cardToMatch = cardContents;
            self.buttonToMatch = sender;
        }
    }
    
}

- (void)FlipFaceDown:(id)sender withIndex:(NSInteger)index{
    UIImage *background = [UIImage imageNamed:@"muhback.png"];
    [sender setBackgroundImage:background forState:UIControlStateNormal];
    [self.buttonToMatch setBackgroundImage:background forState:UIControlStateNormal];
    [self FlipFaceDown:sender];
    [self FlipFaceDown:self.buttonToMatch];
    self.flipBoolArray[index] = @"0";
    NSUInteger newIndex = [self.cardCollection indexOfObject:self.buttonToMatch];
    self.flipBoolArray[newIndex] = @"0";
}

- (void)DisableUIControl:(UIControl *)control {
    control.enabled = NO;
}

- (void)EnableUIControl:(UIControl *)control {
    control.enabled = YES;
}

- (void)FlipFaceDown:(UIButton *)buttonCard {
    [buttonCard setTitle:@" " forState:UIControlStateNormal];
    UIImage *background = [UIImage imageNamed:@"muhback.png"];
    [buttonCard setBackgroundImage:background forState:UIControlStateNormal];

}

- (BOOL)matchCard:(Card*)card1 withCard:(Card*)card2
{
    PlayingCard *pCard1 = [PlayingCard playingCardFromCard:card1];
    PlayingCard *pCard2 = [PlayingCard playingCardFromCard:card2];
    if (pCard1.rank == pCard2.rank)
    {
        // ranks match
        [self changeScore:16];
        return true;
    }
    else if ([pCard1.suit isEqualToString:pCard2.suit])
    {
        // suits match
        [self changeScore:4];
        return true;
    }
    else
    {
        return false;
    }
}

- (IBAction)ResetGame:(id)sender {
    [self viewDidLoad];
    for (int i = 0; i < self.cardCollection.count; i++)
    {
        [self EnableUIControl:[self.cardCollection objectAtIndex:i]];
        [self FlipFaceDown:[self.cardCollection objectAtIndex:i]];
    }
}
@end
