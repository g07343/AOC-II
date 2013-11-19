//
//  AddEventViewController.m
//  baseProject
//
//  Created by Matthew Lewis on 11/19/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "AddEventViewController.h"
#import "SavedEvents.h"
@interface AddEventViewController ()

@end

@implementation AddEventViewController

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
    
    //set up keyboard listeners
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    //set up swipe recognizer and add to label
    leftSwiper = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
    leftSwiper.direction = UISwipeGestureRecognizerDirectionLeft;
    [swipeLabel addGestureRecognizer:leftSwiper];
    
    //disable close keyboard button initially
    closeKeyboard.enabled = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onSwipe:(UISwipeGestureRecognizer*)recognizer
{//check if swiping the correct direction
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft)
    {//check if the event data is correct
        if (![eventName.text  isEqual: @""])
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
            NSString *nameString = eventName.text;
            
            NSString *finalString = [[NSString alloc]initWithFormat:@"New Event:  %@ \n%@\n\n", nameString, dateString];
            //set data to holder function in singleton
            [[SavedEvents GetInstance] holdData:finalString];
            
            [self dismissModalViewControllerAnimated:true];
        } else {
            swipeLabel.text = @"Please input a title for your event";
        }
    }
}

-(IBAction)onClick:(id)sender
{//pretty much only handles the keyboard close functionality
    [eventName resignFirstResponder];
    closeKeyboard.enabled = NO;
}

-(IBAction)onChange:(id)sender
{//get current time and set to Date variable to reset scrollwheel
    NSDate *now = [[ NSDate alloc ] initWithTimeIntervalSinceNow: (NSTimeInterval) 0 ];
    //reset scrollwheel to current date if user tries to set it to past
    if ([eventDate.date timeIntervalSinceNow] < 0)
        eventDate.date = now;
}

-(void)keyboardWillShow:(NSNotification *)notification
{
    closeKeyboard.enabled = true;
}

-(void)keyboardWillHide:(NSNotification *)notification
{
    if (![eventName.text  isEqual: @""])
    {
        swipeLabel.text = @"Swipe Left to Close";
    }
}

@end
