//
//  ViewController.h
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddEventViewController.h"

@interface ViewController : UIViewController <EventViewDelegate>
{
    UILabel *appLabel;
    IBOutlet UITextView *textView;
    NSString *eventText;
    int *firstRun;
    NSMutableString *temp;
}

-(IBAction)onClick:(id)sender;

@end
