//
//  ViewController.h
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "robotFactory.h"

@interface ViewController : UIViewController
{//declare labels
    UILabel *appBanner;
    UILabel *displayHelper;
    UILabel *quantityLabel;
    IBOutlet UIStepper *stepControl;
    IBOutlet UITextField *outputField;
    IBOutlet UIButton *attackButton;
    IBOutlet UIButton *repairButton;
    IBOutlet UIButton *scoutButton;
    IBOutlet UIButton *calculateButton;
    IBOutlet UIButton *infoButton;
    int numRobots;
    NSString *currentRobot;
    
}

-(IBAction)onChange:(id)sender;
-(IBAction)onClick:(id)sender;
-(IBAction)segmentClicked:(id)sender;

@end
