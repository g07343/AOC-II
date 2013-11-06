//
//  infoViewController.h
//  baseProject
//
//  Created by Matthew Lewis on 11/5/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface infoViewController : UIViewController <MFMailComposeViewControllerDelegate>{
}

-(IBAction)actionEmailComposer;
-(IBAction)onClick:(id)sender;


@end
