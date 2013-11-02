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
    //use the mutator method
    NSString *attackName = [AttackRobot calculateHitPoints];
    NSString *healthBonus = [NSString stringWithFormat:@"%@'s Health Bonus is %i", [AttackRobot name],[AttackRobot healthBonus]];
    //NSLog(@"%@",attackName);
    //NSLog(@"%@", healthBonus);
    
    //create a repair robot and set it's unique 'shield' property
    repairRobot *RepairRobot = (repairRobot*)[robotFactory createNewRobot:2];
    //set unique attribute through internal method
    [RepairRobot setShield:18];
    //use the mutator method
    NSString *repairName = [RepairRobot calculateHitPoints];
    NSString *shieldBonus = [NSString stringWithFormat:@"%@'s Shield bonus is %i", [RepairRobot name], [RepairRobot shield]];
    //NSLog(@"%@",repairName);
    //NSLog(@"%@", shieldBonus);
    
    //create a scout robot and set it's unique 'armorPenalty' property
    scoutRobot *ScoutRobot = (scoutRobot*)[robotFactory createNewRobot:3];
    //set unique attribute through internal method
    [ScoutRobot setArmorPenalty:4];
    //use the mutator method
    NSString *scoutName = [ScoutRobot calculateHitPoints];
    NSString *armorPenalty = [NSString stringWithFormat:@"%@'s Armor penalty is %i", [ScoutRobot name], [ScoutRobot armorPenalty]];
    //NSLog(@"%@", scoutName);
    //NSLog(@"%@", armorPenalty);
    
    //instantiate all labels and add text/formatting
    attackLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 40.0f, 325.0f, 20.0f)];
    if (attackLabel != nil)
    {
        attackLabel.backgroundColor = [UIColor redColor];
        attackLabel.text = attackName;
        attackLabel.textAlignment = UITextAlignmentCenter;
    }
    
    attackCustom = [[UILabel alloc]initWithFrame:CGRectMake(0, 80.0f, 325.0f, 20.0f)];
    if (attackCustom != nil)
    {
        attackCustom.backgroundColor = [UIColor redColor];
        attackCustom.text = healthBonus;
        attackCustom.textAlignment = UITextAlignmentCenter;
    }
    
    repairLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 120.0f, 325.0f, 20.0f)];
    if (repairLabel != nil)
    {
        repairLabel.backgroundColor = [UIColor blueColor];
        repairLabel.text = repairName;
        repairLabel.textColor = [UIColor whiteColor];
        repairLabel.textAlignment = UITextAlignmentCenter;
    }
    
    repairCustom = [[UILabel alloc]initWithFrame:CGRectMake(0, 160.0f, 325.0f, 20.0f)];
    if(repairCustom != nil)
    {
        repairCustom.backgroundColor = [UIColor blueColor];
        repairCustom.text = shieldBonus;
        repairCustom.textColor = [UIColor whiteColor];
        repairCustom.textAlignment = UITextAlignmentCenter;
    }
    
    scoutLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 200.0f, 325.0f, 20.0f)];
    if (scoutLabel != nil)
    {
        scoutLabel.backgroundColor = [UIColor yellowColor];
        scoutLabel.text = scoutName;
        scoutLabel.textAlignment = UITextAlignmentCenter;
    }
    
    scoutCustom = [[UILabel alloc]initWithFrame:CGRectMake(0, 240.0f, 325.0f, 20.0f)];
    if (scoutCustom != nil)
    {
        scoutCustom.backgroundColor = [UIColor yellowColor];
        scoutCustom.text = armorPenalty;
        scoutCustom.textAlignment = UITextAlignmentCenter;
    }
    
    //add labels to UIView
    [self.view addSubview:attackLabel];
    [self.view addSubview:attackCustom];
    [self.view addSubview:repairLabel];
    [self.view addSubview:repairCustom];
    [self.view addSubview:scoutLabel];
    [self.view addSubview:scoutCustom];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
