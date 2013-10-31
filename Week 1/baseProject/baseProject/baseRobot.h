//
//  baseRobot.h
//  baseProject
//
//  Created by Matthew Lewis on 10/30/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface baseRobot : NSObject
{
    int robotEnum;
}
typedef enum {
    AttackBot,
    RepairBot,
    ScoutBot
} robotEnum;

@property NSString *name;
@property int hitPoints;

-(id)init;

-(NSString*)calculateHitPoints;

@end
