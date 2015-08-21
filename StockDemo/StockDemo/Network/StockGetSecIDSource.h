//
//  StockGetSecIDSource.h
//  StockDemo
//
//  Created by chuguangming on 15/8/21.
//  Copyright © 2015年 chu. All rights reserved.
//

#import "StockBaseSource.h"
typedef void (^StockGetSecIDCompletionBlock)(NSArray * data,NSString *errorString);
@interface StockGetSecIDSource : StockBaseSource
+(StockGetSecIDSource *)discoverSource;
-(void)getDiscoverList:(NSString *)searchString completion:(StockGetSecIDCompletionBlock)completionBlock;
@end
