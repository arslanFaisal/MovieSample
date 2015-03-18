//
//  MSUtility.m
//  MovieSample
//
//  Created by Arslan  on 18/03/2015.
//  Copyright (c) 2015 Arslan . All rights reserved.
//

#import "MSUtility.h"

@implementation MSUtility
static MSUtility* _sharedObject = nil;

+ (id)sharedUtility
{
    @synchronized([MSUtility class])
    {
        if (!_sharedObject){
            _sharedObject = [[self alloc] init];
        }
        return _sharedObject;
    }
    
    return nil;
}
//remove NSNULL from string
+(NSString*)removeNullFromString:(NSObject*)input {
    NSString *output = nil;
    //Checking if its actually a string and not nil
    if ([input isKindOfClass:[NSString class]]) {
        NSString *inputString = (NSString *) input;
        if (inputString != nil || [inputString length] > 0){
            output = inputString;
        }
    }
    return output;
}
//remove NSNULL from Array
+(NSArray*)removeNullFromArray:(NSObject*)input {
    NSArray *output = nil;
    //Checking if its actually an array and not nil or NULL
    if ([input isKindOfClass:[NSArray class]]) {
        NSArray *inputArray = (NSArray *) input;
        if (inputArray != nil){
            output = inputArray;
        }
    }
    return output;
}
//remove NSNULL from Dictionary
+(NSDictionary*)removeNullFromDictionary:(NSObject*)input {
    NSDictionary *output = nil;
    //Checking if its actually a dictionary and not nil or NULL
    if ([input isKindOfClass:[NSDictionary class]]) {
        NSDictionary *inputDictionary = (NSDictionary *) input;
        if (inputDictionary != nil){
            output = inputDictionary;
        }
    }
    return output;
}
@end
