//
//  movieSample.m
//  MovieSample
//
//  Created by Arslan  on 18/03/2015.
//  Copyright (c) 2015 Arslan . All rights reserved.
//

#import "MovieSample.h"

@implementation MovieSample
-(id)initWithWithDictionary:(NSDictionary*)sampleDict{
    self = [super init];
    if (self) {
        //Parsign the json item associated with object after removing possible NULL values to avoid crashes
        self.headline = [MSUtility removeNullFromString:[sampleDict objectForKey:@"headline"]];
        self.imageURL = nil;
        NSArray *imgURLArray = [MSUtility removeNullFromArray:[sampleDict objectForKey:@"keyArtImages"]];
        if (imgURLArray && imgURLArray.count) {
            NSDictionary *imageURLDict = [MSUtility removeNullFromDictionary:[imgURLArray objectAtIndex:0]];
            self.imageURL = [MSUtility removeNullFromString:[imageURLDict objectForKey:@"url"]];
        }
    }
    return self;
}
@end
