//
//  SavedEvents.m
//  baseProject
//
//  Created by Matthew Lewis on 11/19/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "SavedEvents.h"

@implementation SavedEvents

static SavedEvents *_instance = nil;

+(SavedEvents*)GetInstance
{
    if (_instance == nil)
    {
        [[self alloc] init];
    }
    return _instance;
}

+(id)alloc
{
    _instance = [super alloc];
    return _instance;
}

-(id)init
{
    if(self = [super init])
    {
    
    }
    return self;
}

-(void)getData
{
    //responsible for retrieving event data from date picker and text field.
    NSLog(@"getEvent run from singleton!");
}

-(void)setEvent
{

}

-(NSString*) getEvent
{
    NSString *temp = @"";
    
    return temp;
}

@end
