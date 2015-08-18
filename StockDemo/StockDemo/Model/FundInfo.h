//
//  FundInfo.h
//  StockDemo
//
//  Created by chuguangming on 15/8/18.
//  Copyright © 2015年 chu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@class FundData;
@interface FundInfo : JSONModel
@property (copy, nonatomic) NSString *retCode;
@property (copy, nonatomic) NSString *retMsg;
@property (strong, nonatomic) NSArray<FundData *> *data;
@end
