//
//  SpirographView.h
//  Spirograph
//
//  Created by Christopher Zumberge on 2/21/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import <UIKit/UIKit.h>

//@interface SpirographView : UIView <SpirographViewControllerDelegate>
@interface SpirographView : UIView {
    UIView *overWriteView;
    CGFloat lastL,lastK;
}

//@property float lValue;
//@property float kValue;
//@property float numberOfSteps;
//@property float sizeOfStep;
@property (nonatomic) BOOL overWrite;

@property (nonatomic) CGFloat l;
@property (nonatomic) CGFloat k;
@property (nonatomic) CGFloat stepSize;
@property (nonatomic) NSUInteger numberOfSteps;


@end
