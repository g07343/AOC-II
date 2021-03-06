//
//  ViewController.m
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "ViewController.h"
#import "AddEventViewController.h"
@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    firstRun = 0;
    //create app label
    appLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20.0f, 320.0f, 30.0f)];
    
    if (appLabel != nil)
    {
        appLabel.text = @"Date Planner";
        appLabel.backgroundColor = [UIColor whiteColor];
        appLabel.textAlignment = UITextAlignmentCenter;
    }
    [self.view addSubview:appLabel];
    //set up eventText
    textView.text = eventText;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//create onClick function to handle the addEvent button
-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button != nil)
    {
        AddEventViewController *eventView = [[AddEventViewController alloc]initWithNibName:@"AddEventViewController" bundle:nil];
        if (eventView != nil)
        {//set delegate
            eventView.delegate = self;
            [self presentModalViewController:eventView animated:TRUE];
        }
    }
}

-(void)DidClose:(NSString *)eventString
{//create mutable string to hold final string
    NSLog(@"String passed was: %@", eventString);
    if (firstRun == 0)
    {
        temp = [[NSMutableString alloc]init];
        firstRun ++;
    }
    
    if (temp != nil)
    {
        [temp appendString:eventString];
    }
    textView.text = temp;
}


@end
