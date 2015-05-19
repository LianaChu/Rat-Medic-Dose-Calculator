//
//  AmoxiCalculator.m
//  Rat Dosage Calculator
//
//  Created by Liana Chu on 2/16/15.
//  Copyright (c) 2015 Liana Chu. All rights reserved.
//

#import "AmoxiCalculator.h"

@implementation AmoxiCalculator

+ (float)doseOfAmoxiInmLCalculatedFromWeight:(float)ratWeight;
{
    return (0.04 * ratWeight * 0.02);
}

@end
