//
//  FundData.h
//  StockDemo
//
//  Created by chuguangming on 15/8/18.
//  Copyright © 2015年 chu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@interface FundData : JSONModel
@property (strong, nonatomic) NSString *setID;
@property (strong, nonatomic) NSString *ticker;
@property (strong, nonatomic) NSString *retCode;
@property (strong, nonatomic) NSString *secShortName;
@property (strong, nonatomic) NSString *tradeAbbrName;
@property (strong, nonatomic) NSString *category;
@property (strong, nonatomic) NSString *operationMode;
@property (strong, nonatomic) NSString *isQdii;
@property (strong, nonatomic) NSString *isFof;
@property (strong, nonatomic) NSString *isGuarFund;
@property (strong, nonatomic) NSString *listStatusCd;
@property (strong, nonatomic) NSString *establishDate;
@property (strong, nonatomic) NSString *managementCompany;
@property (strong, nonatomic) NSString *managementFullName;
@property (strong, nonatomic) NSString *custodian;
@property (strong, nonatomic) NSString *custodianFullName;
@property (strong, nonatomic) NSString *investField;
@property (strong, nonatomic) NSString *perfBenchmark;
@property (strong, nonatomic) NSString *isClass;
@end
