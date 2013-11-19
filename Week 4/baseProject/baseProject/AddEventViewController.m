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
