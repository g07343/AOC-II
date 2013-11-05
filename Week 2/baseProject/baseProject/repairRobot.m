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
{//init repairRobot class
    self = [super init];
    if (self != nil)
    {//override defaults from base class and assign a value to unique data
        [self setHitPoints:20];
        [self setName:@"Repair Robot"];
        [self setShield:15];
        NSLog(@"Repair Robot created!");
    }
    return self;
}
//override function inherited from base class to utilize unique class-specific data
-(NSString*)calculateHitPoints
{
    [self setHitPoints:(self.hitPoints * shield)];
    //NSLog(@"Repair robot has %i hitpoints", self.hitPoints);
    NSString *temp = [NSString stringWithFormat:@"%@ has %i hitpoints", self.name, self.hitPoints];
    return temp;
}

@end
