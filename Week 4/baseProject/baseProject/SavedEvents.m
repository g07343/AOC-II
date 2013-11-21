//
//  SavedEvents.m
//  baseProject
//
//  Created by Matthew Lewis on 11/19/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "SavedEvents.h"
#import "AddEventViewController.h"
@implementation SavedEvents

static SavedEvents *_instance = nil;

+(SavedEvents*)GetInstance
{
    if (_instance == nil)
    {
        _instance = [[self alloc]init];
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


-(NSString*) getEvent
{
    if (eventString != nil)
    {
        return eventString;
    }
    return nil;
}

-(void)holdData:(NSString*)event
{
    eventString = event;
    NSLog(@"%@", eventString);
}

@end
