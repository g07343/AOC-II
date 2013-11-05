//
//  scoutRobot.m
//  baseProject
//
//  Created by Matthew Lewis on 10/30/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "scoutRobot.h"

@implementation scoutRobot
@synthesize armorPenalty;

-(id)init
{//init scoutRobot class
    self = [super init];
    if (self != nil)
    {
        [self setHitPoints:20];
        [self setName:@"Scout Robot"];
        [self setArmorPenalty:10];
        NSLog(@"Scout Robot created!");
    }
    return self;
}
//override function from base class to utilize class specific data
-(NSString*)calculateHitPoints
{
    [self setHitPoints:(self.hitPoints - armorPenalty)];
    //NSLog(@"Scout robot has %i hitpoints", self.hitPoints);
    NSString *temp = [NSString stringWithFormat:@"%@ has %i hitpoints", self.name, self.hitPoints];
    return temp;
}
@end
