//
//  ViewController.h
//  Quiz8
//
//  Created by Christopher Zumberge on 4/11/14.
//  Copyright (c) 2014 Christopher Zumberge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawView.h"

@interface ViewController : UIViewController
{
    CGFloat lastVelocity;
}
- (IBAction)addVertical:(id)sender;
- (IBAction)addHorizontal:(id)sender;


@property (weak, nonatomic) IBOutlet DrawView *drawView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UIView *leftView;

@end
