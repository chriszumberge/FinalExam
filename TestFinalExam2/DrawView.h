//
//  DrawView.h
//  Quiz8
//
//  Created by Christopher Zumberge on 4/13/14.
//  Copyright (c) 2014 Christopher Zumberge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView
-(void) saveCurrentPoint;
-(void) forceRedraw;

@property (nonatomic) CGPoint currentPoint;
@property (nonatomic, strong) NSMutableArray *allPoints;

@property (nonatomic) CGFloat HorizontalAngle;
@property (nonatomic) CGFloat Velocity;
@property (nonatomic) CGFloat VerticalAngle;

@end
