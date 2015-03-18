//
//  movieSample.h
//  MovieSample
//
//  Created by Arslan  on 18/03/2015.
//  Copyright (c) 2015 Arslan . All rights reserved.

//This class is a model object to keep the items within the json
#import <Foundation/Foundation.h>

@interface MovieSample : NSObject
//we can add properties to this object later but for now we only need these two
@property (nonatomic,strong) NSString *headline;
@property (nonatomic,strong) NSString *imageURL;
-(id)initWithWithDictionary:(NSDictionary*)sampleDict;//custom constructor
@end
