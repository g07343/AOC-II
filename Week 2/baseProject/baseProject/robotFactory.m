//
//  robotFactory.m
//  baseProject
//
//  Created by Matthew Lewis on 10/30/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "robotFactory.h"

@implementation robotFactory

+(baseRobot *)createNewRobot:(int)robotType
{
    if (robotType == 1)
    {
        return [[attackRobot alloc] init];
    }
    if (robotType == 2)
    {
        return [[repairRobot alloc] init];
    }
    if (robotType == 3)
    {
        return [[scoutRobot alloc] init];
    }
    return nil;
}


@end
