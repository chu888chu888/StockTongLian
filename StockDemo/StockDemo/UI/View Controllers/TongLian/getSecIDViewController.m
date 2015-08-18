//
//  getSecIDViewController.m
//  StockDemo
//
//  Created by chuguangming on 15/8/18.
//  Copyright © 2015年 chu. All rights reserved.
//

#import "getSecIDViewController.h"
#import "AFNetworking.h"
#import "FundData.h"
#import "FundInfo.h"
@interface getSecIDViewController ()

@end

@implementation getSecIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"证券编码及基本上市信息");
    
    AFHTTPRequestOperationManager *operationManager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *params = @{@"username": @"13145877854",@"client_id":@"ObpJAwJ7WP4s4Rwd",
                             @"client_secret":@"WMv9vbYIFz8ugpwl6zDNThzn4KLoxLTV",
                             @"grant_type":@"password",@"password":@"888888"};
    
    operationManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    [operationManager.requestSerializer setValue:@"Bearer 333ee5a7b3ed45438749b3d36f850e8e4728973e319868c07e4ebbf6f94bcd48" forHTTPHeaderField:@"Authorization"];
    
    operationManager.responseSerializer = [AFJSONResponseSerializer serializer];
    operationManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    
    [operationManager GET:@"https://api.wmcloud.com/data/v1/api/fund/getFund.json?field&secID&ticker=000001&etfLof&listStatusCd"
                   parameters:nil
                   success:^(AFHTTPRequestOperation *operation, id responseObject) {
                       NSLog(@"Json:%@",responseObject);
                       
                       /*
                        NSString *access_tokenStr = responseObject[@"access_token"];
                        NSString *expires_inStr = responseObject[@"expires_in"];
                        NSString *refresh_tokenStr = responseObject[@"refresh_token"];
                        NSString *token_typeStr = responseObject[@"token_type"];
                        */
                       /*
                        NSLog(@"--------------------------");
                        NSString* json = @"{\"access_token\":\"access_token\", \"expires_in\":\"access_token\",\"refresh_token\":\"access_token\",\"token_type\":\"access_token\",}";
                        HttpReturnModel *returnModel=[[HttpReturnModel alloc]initWithString:returnJsonStr error:nil];
                        NSLog(@"Model:%@",returnModel.access_token);
                        */
                       /*
                        NSString *returnStr=[self dictionaryOrArrayToJSONString:responseObject];
                        HttpReturnModel *returnModel=[[HttpReturnModel alloc]initWithString:returnStr error:nil];
                        NSLog(@"access_token:%@",returnModel.access_token);*/
                       
                       //FundData * fundClass=[FundData objectWithKeyValues:[responseObject objectForKey:@"data"]];
                       
                       //NSLog(@"%@",responseObject[@"data"]);
                       //FundData * fundClass=[FundData objectWithKeyValues:[responseObject objectForKey:@"data"]];
                       //FundInfo * fundClass=[[FundInfo alloc] initWithString:responseObject error:nil];

                       NSLog(@"retCode :%@",responseObject[@"retCode"]);
                       NSLog(@"retMsg :%@",responseObject[@"retMsg"]);
                       NSLog(@"data :%@",responseObject[@"data"][0]);
                       NSLog(@"investField:%@",[responseObject[@"data"][0] objectForKey:@"investField"]);

                   }
                   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                       
                       NSLog(@"Error: %@", [error description]);
                       
                   }
     ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
