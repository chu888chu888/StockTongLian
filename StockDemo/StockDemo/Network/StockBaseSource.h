//
//  StockBaseSource.h
//  StockDemo
//
//  Created by chuguangming on 15/8/19.
//  Copyright © 2015年 chu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StockBaseSource : NSObject
@property(nonatomic,strong) NSOperationQueue *operationQuene;
-(NSDictionary *) dictionaryFromResponseData:(NSData *)responseData ;
@end
