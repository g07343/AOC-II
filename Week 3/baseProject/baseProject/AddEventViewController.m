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
            //get Date
            UIDatePicker *picker = (UIDatePicker*)sender;
            if (picker != nil)
            {//set value of date picker to dateString var
                NSDate *date = eventDate.date;
                //format date
                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                if (dateFormatter != nil)
                {
                    [dateFormatter setDateFormat:@"LLL dd, yyyy h:mm:ss aaa"];
                    dateString = [dateFormatter stringFromDate:date];
                }
            }
            //capture event title
            NSString *eventTitle = eventName.text;
            NSString *finalString = [[NSString alloc]initWithFormat:@"New Event:  %@ \n%@", eventTitle, dateString];
            NSLog(@"%@",finalString);
            //init class
            [self dismissModalViewControllerAnimated:TRUE];
            
            if (delegate != nil)
            {
                [delegate DidClose:finalString];
            }
        } else if (button.tag == 1)
        {
            [eventName resignFirstResponder];
        }
    }
}

-(IBAction)onChange:(id)sender
{
    
}
//setup default keyboard observer functions
-(void)keyboardWillShow:(NSNotification *)notification
{
    
}

-(void)keyboardWillHide:(NSNotification *)notification
{
    
}

@end
