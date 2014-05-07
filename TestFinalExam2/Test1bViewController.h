//
//  Test1bViewController.h
//  Test1b
//
//  Created by Christopher Zumberge on 2/26/14.
//  Copyright (c) 2014 Christopher Zumberge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardMatchingGame.h"
#import "PlayingCard.h"

@interface Test1bViewController : UIViewController
{

}
- (IBAction)ResetGame:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *contents1Label;
@property (weak, nonatomic) IBOutlet UILabel *contents2Label;

@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSMutableArray *cardCollection;

@property (weak, nonatomic) IBOutlet UILabel *labelScore;
@property (weak, nonatomic) IBOutlet UILabel *scoreValue;

@property (nonatomic) BOOL oneFlipped;
@property (strong, nonatomic) NSMutableArray *flipBoolArray;
@property (strong, nonatomic) NSString *cardToMatch;
@property (strong, nonatomic) UIButton *buttonToMatch;
@property (strong, nonatomic) Card *matchCard;
- (IBAction)flipCard:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *button0;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIButton *button9;
@property (weak, nonatomic) IBOutlet UIButton *button10;
@property (weak, nonatomic) IBOutlet UIButton *button11;
@property (weak, nonatomic) IBOutlet UIButton *button12;
@property (weak, nonatomic) IBOutlet UIButton *button13;
@property (weak, nonatomic) IBOutlet UIButton *button14;
@property (weak, nonatomic) IBOutlet UIButton *button15;

@end
