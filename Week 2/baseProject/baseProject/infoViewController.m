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
    [self dismissModalViewControllerAnimated:TRUE];
}

@end
