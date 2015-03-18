//
//  MSNetworkManager.m
//  MovieSample
//
//  Created by Arslan  on 18/03/2015.
//  Copyright (c) 2015 Arslan . All rights reserved.
//

#import "MSNetworkManager.h"
#import "AFHTTPRequestOperation.h"
#import "AFNetworkActivityIndicatorManager.h"

@implementation MSNetworkManager
static MSNetworkManager* _sharedObject = nil;

+ (id)sharedManager
{
    //creating a shared object of class
    @synchronized([MSNetworkManager class])
    {
        if (!_sharedObject){
            _sharedObject = [[self alloc] init];
            [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
        }
        return _sharedObject;
    }
    
    return nil;
}
-(void)downloadSampleJsonAtURL:(NSString*)fileURL{
    //constructing URL and request
    NSString *string = [NSString stringWithFormat:@"%@%@",BASE_URL,fileURL];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //Creating AFNetworking operation for downloading json
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        //Calling Delegates Success callback if delegate has implemented the call
        if ([self.jsonDelegate respondsToSelector:@selector(getJsonDidSuccessWithJson:)]) {
            //cehcking so we don't send NULL values through
            NSArray *jsonArray = [MSUtility removeNullFromArray:responseObject];
            [self.jsonDelegate getJsonDidSuccessWithJson:jsonArray];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //Calling Delegates failure callback if delegate has implemented the call
        if ([self.jsonDelegate respondsToSelector:@selector(getJsonDidFail:)]) {
            
        }
    }];
    [operation start];
}
@end
