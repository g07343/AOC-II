//
//  robotFactory.h
//  baseProject
//
//  Created by Matthew Lewis on 10/30/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseRobot.h"
#import "attackRobot.h"
#import "repairRobot.h"
#import "scoutRobot.h"

@interface robotFactory : NSObject

+(baseRobot *)createNewRobot: (int)robotType;

@end
