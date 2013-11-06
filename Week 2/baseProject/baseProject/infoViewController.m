//
//  infoViewController.m
//  baseProject
//
//  Created by Matthew Lewis on 11/5/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "infoViewController.h"
#import "ViewController.h"

@interface infoViewController ()

@end

@implementation infoViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button.tag == 0)
    {//close info view
        [self dismissModalViewControllerAnimated:TRUE];
    }
}
//set up code for email
//code and tutorial found at: http://www.iphonedevsdk.com/forum/tutorial-discussion/43633-quick-tutorial-how-add-mfmailcomposeviewcontroller.html

- (IBAction)actionEmailComposer {
    
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        [mailViewController setSubject:@"Subject Goes Here."];
        [mailViewController setMessageBody:@"Your message goes here." isHTML:NO];
        
        [self presentModalViewController:mailViewController animated:YES];
        //[mailViewController release];
        
    }
    
    else {
        
        NSLog(@"Device is unable to send email in its current state.");
        
    }
    
}

-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error: (NSError*)error {
    
    [self dismissModalViewControllerAnimated:YES];
    
}





@end
