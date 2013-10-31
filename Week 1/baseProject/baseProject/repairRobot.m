//
//  repairRobot.m
//  baseProject
//
//  Created by Matthew Lewis on 10/30/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "repairRobot.h"

@implementation repairRobot
@synthesize shield;

-(id)init
{
    self = [super init];
    if (self != nil)
    {
        [self setHitPoints:20];
        [self setName:@"Repair Robot"];
        [self setShield:15];
        NSLog(@"Repair Robot created!");
    }
    return self;
}

-(NSString*)calculateHitPoints
{
    [self setHitPoints:(self.hitPoints * shield)];
    NSLog(@"Repair robot has %i hitpoints", self.hitPoints);
    NSString *temp = [NSString stringWithFormat:@"%@ has %i hitpoints", self.name, self.hitPoints];
    return temp;
}

@end
