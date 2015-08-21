//
//  StockBaseSource.m
//  StockDemo
//
//  Created by chuguangming on 15/8/19.
//  Copyright © 2015年 chu. All rights reserved.
//

#import "StockBaseSource.h"

@implementation StockBaseSource
#pragma mark -
#pragma mark Init Methods
-(id)init
{
    self=[super init];
    if (self) {
        self.operationQuene=[[NSOperationQueue alloc] init];
        self.operationQuene.maxConcurrentOperationCount=1;
    }
    return self;
}

#pragma mark -
#pragma mark Response Data Parsing
-(NSDictionary *)dictionaryFromResponseData:(NSData *)responseData
{
    NSDictionary * dictionary=nil;
    if (responseData) {
        id object=[NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
        if ([object isKindOfClass:[NSDictionary class]]) {
            dictionary=(NSDictionary *)object;
        }
        else
        {
            if (object) {
                dictionary=[NSDictionary dictionaryWithObject:object forKey:@"results"];
            }
            else
            {
                dictionary=nil;
            }
        }
    }
    return dictionary;
}
@end
