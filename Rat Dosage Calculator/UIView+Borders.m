//
//  UIView+Borders.m
//  Rat Dosage Calculator
//
//  Created by Liana Chu on 1/28/15.
//  Copyright (c) 2015 Liana Chu. All rights reserved.
//

#import "UIView+Borders.h"

@implementation UIView (Borders)

- (void)giveBorderOfColor:(UIColor *)color width:(CGFloat)width
{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}

- (void)giveDebugBorder
{
    [self giveBorderOfColor:[UIColor redColor] width:1];
}

@end
