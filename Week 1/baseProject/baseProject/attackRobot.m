//
//  attackRobot.m
//  baseProject
//
//  Created by Matthew Lewis on 10/30/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "attackRobot.h"

@implementation attackRobot

@synthesize healthBonus;

-(id)init
{
    self = [super init];
    if (self != nil)
    {
        [self setHitPoints:40];
        [self setName:@"Attack Robot"];
        [self setHealthBonus:2];
        NSLog(@"Attack Robot created!");
    }
    return self;
}

//override baseRobot calculate function to include extra data
-(NSString*)calculateHitPoints
{
    [self setHitPoints:(self.hitPoints * healthBonus)];
    //NSString *temp = (@"%@ has %i hitpoints", self.name, self.hitPoints);
    NSString *temp = [NSString stringWithFormat:@"%@ has %i hitpoints", self.name, self.hitPoints];
    return temp;
}
@end
