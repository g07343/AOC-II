//
//  ViewController.m
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Use factory to create an attack robot and set it's unique property (healthBonus)
    attackRobot *AttackRobot = (attackRobot*)[robotFactory createNewRobot:1];
    //set unique attribute through internal method
    [AttackRobot setHealthBonus:25];
    NSString *attackName = [AttackRobot calculateHitPoints];
    NSString *healthBonus = [NSString stringWithFormat:@"Health Bonus is %i", [AttackRobot healthBonus]];
    NSLog(@"%@",attackName);
    NSLog(@"%@", healthBonus);
    
    //create a repair robot and set it's unique 'shield' property
    repairRobot *RepairRobot = (repairRobot*)[robotFactory createNewRobot:2];
    //set unique attribute through internal method
    [RepairRobot setShield:12];
    NSString *repairName = [RepairRobot calculateHitPoints];
    NSString *shieldBonus = [NSString stringWithFormat:@"Shield bonus is %i", [RepairRobot shield]];
    NSLog(@"%@",repairName);
    NSLog(@"%@", shieldBonus);
    
    //create a scout robot and set it's unique 'armorPenalty' property
    scoutRobot *ScoutRobot = (scoutRobot*)[robotFactory createNewRobot:3];
    //set unique attribute through internal method
    [ScoutRobot setArmorPenalty:4];
    NSString *scoutName = [ScoutRobot calculateHitPoints];
    NSString *armorPenalty = [NSString stringWithFormat:@"Armor penalty is %i", [ScoutRobot armorPenalty]];
    NSLog(@"%@", scoutName);
    NSLog(@"%@", armorPenalty);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
