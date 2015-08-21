//
//  StockGetSecIDSource.m
//  StockDemo
//
//  Created by chuguangming on 15/8/21.
//  Copyright © 2015年 chu. All rights reserved.
//

#import "StockGetSecIDSource.h"
#import "AFNetworking.h"
@implementation StockGetSecIDSource
#pragma mark -
#pragma mark Init Methods
+(StockGetSecIDSource *)discoverSource
{
    static dispatch_once_t onceToken;
    static StockGetSecIDSource * instace=nil;
    dispatch_once(&onceToken,^{
        instace=[[StockGetSecIDSource alloc]init];
    });
    return instace;
}
#pragma mark -
#pragma mark Request Methods
-(void)getDiscoverList:(NSString *)searchString completion:(StockGetSecIDCompletionBlock)completionBlock
{
    if (completionBlock) {
        AFHTTPRequestOperationManager *operationManager = [AFHTTPRequestOperationManager manager];
        NSDictionary *params = @{
                                 @"assetClass": @"",
                                 @"cnSpell":@"",
                                 @"ticker":searchString,
                                 @"partyID":@"",
                                 @"field":@""};
        operationManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        
        [operationManager.requestSerializer
         setValue:@"Bearer 333ee5a7b3ed45438749b3d36f850e8e4728973e319868c07e4ebbf6f94bcd48"
         forHTTPHeaderField:@"Authorization"];
        
        operationManager.responseSerializer = [AFJSONResponseSerializer serializer];
        operationManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
        
        
        [operationManager GET:@"https://api.wmcloud.com/data/v1/api/master/getSecID.json"
                   parameters:params
                      success:^(AFHTTPRequestOperation *operation, id responseObject)
                      {
                          NSLog(@"JSON: %@", responseObject);
                          NSDictionary* infosDictionary = [self dictionaryFromResponseData:operation.responseData];
                          dispatch_async(dispatch_get_main_queue(), ^{
                              [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                              completionBlock([self processResponseObject:infosDictionary], nil);
                          });

                      }
                      failure:^(AFHTTPRequestOperation *operation, NSError *error)
                      {
                          
                          NSLog(@"Error: %@", error);
                          dispatch_async(dispatch_get_main_queue(), ^{
                              [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                              NSString* errorString = error.localizedDescription;
                              if ([errorString length] == 0)
                                  errorString = nil;
                              completionBlock(nil, errorString);
                          });
                          
                      }
         ];

    }
}
#pragma mark -
#pragma mark Data Parsing

- (NSArray*)processResponseObject:(NSDictionary*)data
{
    if (data == nil)
        return nil;
    NSArray* itemsList = [NSArray arrayWithArray:[data objectForKey:@"data"]];
    return itemsList[0];
}
@end
