//
//  Doxy100mgCalculator.m
//  Rat Dosage Calculator
//
//  Created by Liana Chu on 1/28/15.
//  Copyright (c) 2015 Liana Chu. All rights reserved.
//

#import "Doxy100mgCalculator.h"

@implementation Doxy100mgCalculator

+ (float)doseOfDoxy100InmLCalculatedFromWeight:(float)ratWeight
{
    return (0.05 * 10 * 0.001 * ratWeight);
}

@end
