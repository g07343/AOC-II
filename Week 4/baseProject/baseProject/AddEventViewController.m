//
//  AddEventViewController.m
//  baseProject
//
//  Created by Matthew Lewis on 11/12/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "AddEventViewController.h"
#import "ViewController.h"
@interface AddEventViewController ()

@end

@implementation AddEventViewController

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // set observers for keyboard showing and disappearing
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    //disable buttons that aren't needed yet
    saveButton.enabled = NO;
    closeKeyboard.enabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button != nil)
    {
        if (button.tag == 0)
        {
            //set value of date picker to dateString var
                NSDate *date = eventDate.date;
                //format date
                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                if (dateFormatter != nil)
                {
                    [dateFormatter setDateFormat:@"LLL dd, yyyy h:mm:ss aaa"];
                    dateString = [dateFormatter stringFromDate:date];
                }
            
            //capture event title
            NSString *eventTitle = eventName.text;
            NSString *finalString = [[NSString alloc]initWithFormat:@"New Event:  %@ \n%@\n\n", eventTitle, dateString];
            [self dismissModalViewControllerAnimated:TRUE];
            
            if (delegate != nil)
            {
                [delegate DidClose:finalString];
            }
        } else if (button.tag == 1)
        {
            [eventName resignFirstResponder];
            //only enable save button if there is text in the field
            if (![eventName.text  isEqual: @""])
            {
                saveButton.enabled = YES;
            }
        }
    }
}
//didn't end up using this method of getting the date
-(IBAction)onChange:(id)sender
{//get current time and set to Date variable to reset scrollwheel
    NSDate *now = [[ NSDate alloc ] initWithTimeIntervalSinceNow: (NSTimeInterval) 0 ];
    //reset scrollwheel to current date if user tries to set it to past
    if ( [ eventDate.date timeIntervalSinceNow ] < 0 )
        eventDate.date = now;
}
//setup default keyboard observer functions and toggle keyboard/save buttons accordingly
-(void)keyboardWillShow:(NSNotification *)notification
{
    saveButton.enabled = NO;
    closeKeyboard.enabled = YES;
}

-(void)keyboardWillHide:(NSNotification *)notification
{
   closeKeyboard.enabled = NO;
}

@end
