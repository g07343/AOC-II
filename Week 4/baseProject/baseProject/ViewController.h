//
//  ViewController.h
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UILabel *swipeLabel;
    IBOutlet UITextView *textView;
    IBOutlet UIButton *save;
    UISwipeGestureRecognizer *rightSwiper;
    int *firstRun;
    NSString *temp;
    NSMutableString *eventString;
}

-(IBAction)onClick:(id)sender;

@end
