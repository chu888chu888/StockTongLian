//
//  getSecIDViewController.m
//  StockDemo
//
//  Created by chuguangming on 15/8/19.
//  Copyright © 2015年 chu. All rights reserved.
//

#import "getSecIDViewController.h"
#import "AFNetworking.h"
#import "StockGetSecIDSource.h"
@interface getSecIDViewController ()
@property(nonatomic,strong) UITextField * txtticker;
@property(nonatomic,strong) UITextField * txtsecShortName;
@property(nonatomic,strong) UITextField * txtcnSpell;
@property(nonatomic,strong) UITextField * txtlistDate;
@property(nonatomic,strong) UIButton * btnSearch;
@end

@implementation getSecIDViewController

- (void) loadView
{
    self.view = [[[NSBundle mainBundle] loadNibNamed:@"getSecIDNib" owner:self options:nil] lastObject];
    [self initUI];
}
-(void)initUI
{
    _txtticker=(UITextField *)[self.view viewWithTag:101];
    _btnSearch=(UIButton *)[self.view viewWithTag:102];
    _txtsecShortName=(UITextField *)[self.view viewWithTag:103];
    _txtcnSpell=(UITextField *)[self.view viewWithTag:104];
    _txtlistDate=(UITextField *)[self.view viewWithTag:105];
    [_btnSearch addTarget:self action:@selector(btnSearch:) forControlEvents:UIControlEventTouchDown];
    _txtticker.text=@"000001";
}
#pragma mark -
#pragma mark Fetched Data Processing

- (void)processData:(NSArray*)data
{
    NSLog(@"data:%@",data);
}
-(void)btnSearch:(UIButton *)sender
{
    StockGetSecIDCompletionBlock completionBlock = ^(NSArray* data, NSString* errorString)
    {
            [self processData:data];
    };
    
    StockGetSecIDSource* source = [StockGetSecIDSource discoverSource];
    [source getDiscoverList:_txtticker.text completion:completionBlock];
    
    /*
    //NSLog(@"输入的股票代码是: %@",_txtticker.text);
    AFHTTPRequestOperationManager *operationManager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *params = @{
                             @"assetClass": @"",
                             @"cnSpell":@"",
                             @"ticker":_txtticker.text,
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
                  success:^(AFHTTPRequestOperation *operation, id responseObject) {
                      _txtsecShortName.text=[responseObject[@"data"][0] objectForKey:@"secShortName"];
                      _txtcnSpell.text=[responseObject[@"data"][0] objectForKey:@"cnSpell"];
                      _txtlistDate.text=[responseObject[@"data"][2] objectForKey:@"listDate"];
                      
                      NSLog(@"%@",responseObject);
                  }
                  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                      
                      NSLog(@"Error: %@", [error description]);
                      
                  }
     ];
     */
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
