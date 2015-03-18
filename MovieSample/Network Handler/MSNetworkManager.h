//
//  MSNetworkManager.h
//  MovieSample
//
//  Created by Arslan  on 18/03/2015.
//  Copyright (c) 2015 Arslan . All rights reserved.

//It is a singleton class,This class handles the Network call from anywhere in the project, AFNetworking is used for network connections

#import <Foundation/Foundation.h>
#pragma mark - MSNetworkManagerDelegate:
@class MSNetworkManager;
@protocol MSNetworkManagerDelegate<NSObject>
@optional
#pragma mark - MSNetworkManagerDelegate Delegate Methods
//These methods are optional because this class can be used for other download calls aswell in future so no need to implement these methods in places where not required
-(void) getJsonDidSuccessWithJson:(NSArray*)jsonArray;
-(void) getJsonDidFail:(NSError*)error;
@end

@interface MSNetworkManager : NSObject
@property (nonatomic, retain) id jsonDelegate;
+(id)sharedManager;
//Method used to download the json
-(void)downloadSampleJsonAtURL:(NSString*)fileURL;
@end
