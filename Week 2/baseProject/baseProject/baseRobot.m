//
//  baseRobot.m
//  baseProject
//
//  Created by Matthew Lewis on 10/30/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "baseRobot.h"

@implementation baseRobot

@synthesize hitPoints, name;
//init base class
-(id)init
{
    self = [super init];
    if (self != nil)
    {//set defaults, in this case nothing (want to set in children classes)
        [self setHitPoints:0];
        [self setName:nil];
    }
    return self;
}
//create base method
-(NSString*)calculateHitPoints
{   //need to change this to an actual calculation at some point...
    NSLog(@"Current baseRobot hitPoints are %i", hitPoints);
    NSString *temp = [NSString stringWithFormat:@"%@ has %i hitpoints", self.name, self.hitPoints];
    return temp;
}

@end
