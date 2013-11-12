//
//  AddEventViewController.h
//  baseProject
//
//  Created by Matthew Lewis on 11/12/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEventViewController : UIViewController
{
    IBOutlet UITextField *eventName;
    IBOutlet UIDatePicker *eventDate;
}

-(IBAction)onClick:(id)sender;

@end
