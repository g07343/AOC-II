//
//  AddEventViewController.h
//  baseProject
//
//  Created by Matthew Lewis on 11/12/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EventViewDelegate <NSObject>

-(void)DidClose:(NSString*)eventString;

@end

@interface AddEventViewController : UIViewController <UITextFieldDelegate>
{
    id<EventViewDelegate> delegate;
    IBOutlet UITextField *eventName;
    IBOutlet UIDatePicker *eventDate;
    NSString *dateString;
    
}

-(IBAction)onClick:(id)sender;

-(IBAction)onChange:(id)sender;

@property (strong) id<EventViewDelegate> delegate;
@end

