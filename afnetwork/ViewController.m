//
//  ViewController.m
//  afnetwork
//
//  Created by 郑苏宁 on 14/10/23.
//  Copyright (c) 2014年 郑苏宁. All rights reserved.
//

#import "ViewController.h"
#import "ShopModel.h"
#import "ZSNAFHTTPRequestOperation.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)CacheAction:(id)sender {
    //获取json并以MTLModel进行解析，并且进行缓存
    ZSNAFHTTPRequestOperation *zsnmanager=[ZSNAFHTTPRequestOperation manager];
    [zsnmanager GET:@"http://app.daguaimeishi.com/json2/shopLeftList.php" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject, id responseMTLModel) {
        ShopModel *model=responseMTLModel;
        NSLog(@"%@",model);
        NSLog(@"报废时间%f",model.MTLDateModelMadetime);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    } Location:YES class:[ShopModel class] time:60];//60秒后缓存失效
}

- (IBAction)NocacheAction:(id)sender {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://app.daguaimeishi.com/json2/shopLeftList.php" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        
        NSError *error = nil;
        ShopModel *shop = [MTLJSONAdapter modelOfClass:ShopModel.class fromJSONDictionary:responseObject error:&error];
        
        NSLog(@"%@",shop);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
@end
