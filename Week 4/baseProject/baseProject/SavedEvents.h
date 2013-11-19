//
//  SavedEvents.h
//  baseProject
//
//  Created by Matthew Lewis on 11/19/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SavedEvents : NSObject

+(SavedEvents*)GetInstance;
-(void)getData;
-(void)setEvent;
-(NSString*)getEvent;

@end
