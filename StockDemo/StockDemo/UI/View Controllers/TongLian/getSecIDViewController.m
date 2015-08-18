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
@property(nonatomic,strong) UITextField * txtticker;
@property(nonatomic,strong) UIButton * btnSearch;
@property(nonatomic,strong) UITextView * txtResource;
@end

@implementation getSecIDViewController
- (void) loadView
{
    self.view = [[[NSBundle mainBundle] loadNibNamed:@"getSecIDNib" owner:self options:nil] lastObject];
    _txtticker=(UITextField *)[self.view viewWithTag:101];
    _btnSearch=(UIButton *)[self.view viewWithTag:102];
    _txtResource=(UITextView *)[self.view viewWithTag:103];
    
    [_btnSearch addTarget:self action:@selector(btnSearch:) forControlEvents:UIControlEventTouchDown];
    _txtticker.text=@"000001";
    
}
-(void)btnSearch:(UIButton *)sender
{
    NSLog(@"股票代码:%@",_txtticker.text);
    
    
    AFHTTPRequestOperationManager *operationManager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *params = @{
                             @"field": @"",
                             @"secID":@"",
                             @"ticker":_txtticker.text,
                             @"etfLof":@"",
                             @"listStatusCd":@""};
    
    operationManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    [operationManager.requestSerializer setValue:@"Bearer 333ee5a7b3ed45438749b3d36f850e8e4728973e319868c07e4ebbf6f94bcd48" forHTTPHeaderField:@"Authorization"];
    
    operationManager.responseSerializer = [AFJSONResponseSerializer serializer];
    operationManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    
    [operationManager GET:@"https://api.wmcloud.com/data/v1/api/fund/getFund.json"
                  parameters:params
                  success:^(AFHTTPRequestOperation *operation, id responseObject) {
                      /*
                      NSLog(@"Json:%@",responseObject);
                      NSLog(@"retCode :%@",responseObject[@"retCode"]);
                      NSLog(@"retMsg :%@",responseObject[@"retMsg"]);
                      NSLog(@"data :%@",responseObject[@"data"][0]);
                      NSLog(@"investField:%@",[responseObject[@"data"][0] objectForKey:@"investField"]);
                       */
                      _txtResource.text=[responseObject[@"data"][0] objectForKey:@"investField"];
                      
                  }
                  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                      
                      NSLog(@"Error: %@", [error description]);
                      
                  }
     ];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
