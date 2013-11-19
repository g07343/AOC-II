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
    
    eventString = [[NSMutableString alloc] initWithString:@""];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (defaults != nil)
    {
        NSString *saved = [defaults objectForKey:@"events"];
        [eventString appendString:saved];
        textView.text = saved;
        NSLog(@"Save data found: %@",saved);
    }
    
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

//add back in the 'viewDidAppear' default method to refresh data everytime main view appears
-(void)viewDidAppear:(BOOL)animated
{
    NSString *addedEvent = [[SavedEvents GetInstance] getEvent];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (defaults != nil)
    {
        NSString *savedEvents = [defaults objectForKey:@"events"];
        
        if (addedEvent != nil)
        {
            [eventString appendString:addedEvent];
        }
        
        textView.text = eventString;
    }
}

-(IBAction)onClick:(id)sender
{//save out any additional events
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (defaults != nil)
    {
        temp = textView.text;
        //set the data for defaults
        [defaults setObject:temp forKey:@"events"];
        
        //save data
        [defaults synchronize];
    }
}

@end
