//
//  AddEventViewController.h
//  baseProject
//
//  Created by Matthew Lewis on 11/19/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEventViewController : UIViewController
{
    IBOutlet UILabel *swipeLabel;
    IBOutlet UITextField *eventName;
    IBOutlet UIDatePicker *eventDate;
    IBOutlet UIButton *closeKeyboard;
    UISwipeGestureRecognizer *leftSwiper;
    NSString *dateString;
}

-(IBAction)onClick:(id)sender;
-(IBAction)onChange:(id)sender;

@end
