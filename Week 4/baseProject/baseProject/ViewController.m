//
//  ViewController.m
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "ViewController.h"
#import "AddEventViewController.h"
#import "SavedEvents.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //retrieve any saved events upon load and set to string
    temp = [[SavedEvents GetInstance]getEvent];
    
    //append loaded string to mutablestring
    [eventString appendString:temp];
    
	rightSwiper = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
    rightSwiper.direction = UISwipeGestureRecognizerDirectionRight;
    [swipeLabel addGestureRecognizer:rightSwiper];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onSwipe:(UISwipeGestureRecognizer*)recognizer
{
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight)
    {
        AddEventViewController *eventView = [[AddEventViewController alloc]initWithNibName:@"AddEventViewController" bundle:nil];
        if (eventView != nil)
        {
            [self presentModalViewController:eventView animated:true];
        }
    }
}

-(IBAction)onClick:(id)sender
{//save out any additional events
    [[SavedEvents GetInstance]setEvent];
}

@end
