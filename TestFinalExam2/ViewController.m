//
//  ViewController.m
//  Quiz8
//
//  Created by Christopher Zumberge on 4/11/14.
//  Copyright (c) 2014 Christopher Zumberge. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// init velocity
    lastVelocity = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



- (IBAction)addVertical:(id)sender {
    UIRotationGestureRecognizer *rotSender = sender;
    NSLog(@"%f radians horizontal", rotSender.rotation);
    if (lastVelocity > 0 && rotSender.velocity < 0) {
        [self.drawView saveCurrentPoint];
    }
    if (lastVelocity < 0 && rotSender.velocity > 0) {
        [self.drawView saveCurrentPoint];
    }
    self.drawView.HorizontalAngle = rotSender.rotation;
    self.drawView.Velocity = rotSender.velocity;
    [self.drawView forceRedraw];
    if (rotSender.state == UIGestureRecognizerStateEnded) {
        [self.drawView saveCurrentPoint];
    }
    lastVelocity = rotSender.velocity;
}

- (IBAction)addHorizontal:(id)sender {
    UIRotationGestureRecognizer *rotSender = sender;
    if (lastVelocity > 0 && rotSender.velocity < 0) {
        [self.drawView saveCurrentPoint];
    }
    if (lastVelocity < 0 && rotSender.velocity > 0) {
        [self.drawView saveCurrentPoint];
    }
    self.drawView.VerticalAngle = rotSender.rotation;
    self.drawView.Velocity = rotSender.velocity;
    [self.drawView forceRedraw];
    if (rotSender.state == UIGestureRecognizerStateEnded) {
        [self.drawView saveCurrentPoint];
    }
    lastVelocity = rotSender.velocity;
}

@end
