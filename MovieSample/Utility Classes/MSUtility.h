//
//  MSUtility.h
//  MovieSample
//
//  Created by Arslan  on 18/03/2015.
//  Copyright (c) 2015 Arslan . All rights reserved.

//Its a singleton Utility class which keeps the helper methods to be used across the project, One could have used AppDelegate for this purpose but it makes it scaleable to have separate class to avoid code cluttering in AppDelegate

#import <Foundation/Foundation.h>

//This class is created to add any assitance method for the whole project
@interface MSUtility : NSObject
+(id)sharedUtility;
//NULL removal method for different objects
+(NSString*)removeNullFromString:(NSObject*)input;
+(NSArray*)removeNullFromArray:(NSObject*)input;
+(NSDictionary*)removeNullFromDictionary:(NSObject*)input;
@end
