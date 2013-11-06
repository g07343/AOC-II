//
//  ViewController.m
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "ViewController.h"
#import "infoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //set calculate button to disabled
    calculateButton.enabled = NO;
    
    //alloc stepController
    stepControl = [[UIStepper alloc]init];
    if (stepControl != nil)
    {
    //manually set value
    stepControl.value = 1;
    numRobots = stepControl.value;
    
    }
    
    //create main 'banner' label for app and add to xib
    appBanner = [[UILabel alloc]initWithFrame:CGRectMake(0, 20.0f, 320.f, 30.0f)];
    if (appBanner != nil)
    {
        appBanner.backgroundColor = [UIColor blackColor];
        appBanner.text = @"Build a robot!";
        appBanner.textColor = [UIColor whiteColor];
        appBanner.textAlignment = UITextAlignmentCenter;
    }
    
    displayHelper = [[UILabel alloc]initWithFrame:CGRectMake(0, 50.0f, 100.0f, 50.0f)];
    if (displayHelper != nil)
    {
        displayHelper.text = @"Robot to be created:";
        displayHelper.textAlignment = UITextAlignmentCenter;
        displayHelper.numberOfLines = 3;
    }
    
    quantityLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 100.0f, 100.0f, 50.0f)];
    if (quantityLabel != nil)
    {
        quantityLabel.text = @"Quantity:";
        quantityLabel.textAlignment = UITextAlignmentCenter;
        quantityLabel.numberOfLines = 2;
    }
    //add labels to view
    [self.view addSubview:appBanner];
    [self.view addSubview:displayHelper];
    [self.view addSubview:quantityLabel];
//    //create two NSString objects to compare and set stepControl to inactive initially
//    NSString *defaultText = outputField.text;
//    NSString *temp = [[NSString alloc]initWithFormat:@"Pick a robot!"];
//    if ([defaultText isEqualToString:temp])
//    {
//        stepControl.enabled = YES;
//        NSLog(@"disabled.");
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//capture change in value from stepper
-(IBAction)onChange:(id)sender
{//reset the calculate button to allow user interaction (but only after initial robot choice is made)
    if(currentRobot !=nil)
    {
        NSString *temp = outputField.text;
        NSLog(@"%@",temp);
        calculateButton.enabled = YES;
    }
    displayHelper.text = @"Robot to be created:";
    stepControl = (UIStepper*)sender;
    if (stepControl != nil)
    {
        numRobots = stepControl.value;
        NSString *updateString = [[NSString alloc]initWithFormat:@"%i %@", numRobots, currentRobot];
        if (currentRobot !=nil)
        {
            outputField.text = updateString;
        }
    }
}
//onClick method to capture button presses
-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button != nil)
    {
        if (button.tag == 0)
        {//manually reset values to minimum everytime a new robot is selected (in case user was messing with stepControl before)
            numRobots = 1;
            displayHelper.text = @"Robot to be created:";
            stepControl.value = 1;
            button.enabled = NO;
            repairButton.enabled = YES;
            scoutButton.enabled = YES;
            calculateButton.enabled = YES;
            currentRobot = @"Attack robot";
            NSString *attackString = [[NSString alloc]initWithFormat:@"%i %@", numRobots, currentRobot];
            outputField.text = attackString;
        } else if (button.tag == 1)
        {
            numRobots = 1;
            displayHelper.text = @"Robot to be created:";
            stepControl.value = 1;
            button.enabled = NO;
            attackButton.enabled = YES;
            scoutButton.enabled = YES;
            calculateButton.enabled = YES;
            currentRobot = @"Repair robot";
            NSString *repairString = [[NSString alloc]initWithFormat:@"%i %@", numRobots, currentRobot];
            outputField.text = repairString;
        }else if (button.tag == 2)
        {
            numRobots = 1;
            displayHelper.text = @"Robot to be created:";
            stepControl.value = 1;
            button.enabled = NO;
            attackButton.enabled = YES;
            repairButton.enabled = YES;
            calculateButton.enabled = YES;
            currentRobot = @"Scout robot";
            NSString *scoutString = [[NSString alloc]initWithFormat:@"%i %@", numRobots, currentRobot];
            outputField.text = scoutString;
        }else if (button.tag == 3)
        {
            displayHelper.text = @"Resulting Hit Points:";
            NSString *attackTemp = @"Attack robot";
            NSString *repairTemp = @"Repair robot";
            NSString *scoutTemp = @"Scout robot";
            //check which robot is currently chosen
            if ([currentRobot isEqualToString:attackTemp])
            {
                // Use factory to create an attack robot and set it's unique property (healthBonus)
                attackRobot *AttackRobot = (attackRobot*)[robotFactory createNewRobot:1];
                //set unique attribute through internal method
                [AttackRobot setHealthBonus:75];
                //use the mutator method and multiply by the current number of robots
                [AttackRobot calculateHitPoints];
                int temp = numRobots * [AttackRobot hitPoints];
                NSString *attackText = [NSString stringWithFormat:@"%i %@s = %i Hit Points", numRobots, [AttackRobot name], temp];
                outputField.text = attackText;
                
            } else if ([currentRobot isEqualToString:repairTemp])
            {
                //create a repair robot and set it's unique 'shield' property
                repairRobot *RepairRobot = (repairRobot*)[robotFactory createNewRobot:2];
                //set unique attribute through internal method
                [RepairRobot setShield:18];
                //use the mutator method
                [RepairRobot calculateHitPoints];
                int temp = numRobots * [RepairRobot hitPoints];
                NSString *repairText = [NSString stringWithFormat:@"%i %@s = %i Hit Points", numRobots, [RepairRobot name], temp];
                outputField.text = repairText;
            } else if ([currentRobot isEqualToString:scoutTemp])
            {
                //create a scout robot and set it's unique 'armorPenalty' property
                scoutRobot *ScoutRobot = (scoutRobot*)[robotFactory createNewRobot:3];
                //set unique attribute through internal method
                [ScoutRobot setArmorPenalty:4];
                //use the mutator method
                [ScoutRobot calculateHitPoints];
                int temp = numRobots * [ScoutRobot hitPoints];
                NSString *scoutText = [NSString stringWithFormat:@"%i %@s = %i Hit Points", numRobots, [ScoutRobot name], temp];
                outputField.text = scoutText;
            }
            calculateButton.enabled = NO;
        }
        else if (button.tag == 4)
        {//4th tag is info button so init new view
            infoViewController *infoView = [[infoViewController alloc] initWithNibName:@"infoView" bundle:nil];
            if (infoView != nil)
            {//display infoView
                [self presentModalViewController:infoView animated:TRUE];
            }
        }
    }
}

-(IBAction)segmentClicked:(id)sender
{//instantiate segmentedControl to capture button presses
    UISegmentedControl *segmentControl = (UISegmentedControl*)sender;
    if (segmentControl != nil)
    {
        int selected = segmentControl.selectedSegmentIndex;
        //try a switch instead of several if statements to check currently selected button
        switch (selected) {
            case 0:
                //this color is the default (hooray for color pickers!)
                [self.view setBackgroundColor: [UIColor colorWithRed:0.749 green:0.749 blue:0.749 alpha:1]];
                break;
                
            case 1:
                [self.view setBackgroundColor: [UIColor yellowColor]];
                break;
                
            case 2:
                [self.view setBackgroundColor: [UIColor colorWithRed:0.867 green:0.576 blue:0.255 alpha:1]];
                break;
                
            case 3:
                [self.view setBackgroundColor: [UIColor whiteColor]];
                break;
                
            default:
                break;
        }
    }
}

@end
