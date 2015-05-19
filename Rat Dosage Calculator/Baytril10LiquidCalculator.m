//
//  Baytril10LiquidCalculator.m
//  Rat Dosage Calculator
//
//  Created by Liana Chu on 1/28/15.
//  Copyright (c) 2015 Liana Chu. All rights reserved.
//

#import "Baytril10LiquidCalculator.h"
@implementation Baytril10LiquidCalculator

+ (float)doseOfBaytril10InmLCalculatedFromWeight:(float)ratWeightInGrams;
{
    return (0.01* 15 * 0.001 * ratWeightInGrams);
}

@end
