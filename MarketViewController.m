//
//  MarketViewController.m
//  82
//
//  Created by Andrea Gottardo on 4/10/16.
//  Copyright © 2016 Andrea Gottardo. All rights reserved.
//

#import "MarketViewController.h"

@interface MarketViewController ()

@end

@implementation MarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.productIDs addObject:@"buy25w"];
    [self.productIDs addObject:@"buy100w"];
    [self.productIDs addObject:@"buy500w"];
    [self.productIDs addObject:@"removeads"];
    [self requestProductsInfo];
    // Do any additional setup after loading the view.
}

-(void)requestProductsInfo {
    if ([SKPaymentQueue canMakePayments]) {
        NSSet *productIdentifiers = [NSSet setWithArray:self.productIDs];
        SKProductsRequest *productRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:productIdentifiers];
        productRequest.delegate = self;
        [productRequest start];
    } else {
        NSLog(@"Cannot perform In-App purchases.");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"In-App Purchases are not allowed" message:@"Apparently, in-app purchases are not allowed on this device." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

-(void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
    if (response.products.count != 0) {
        for (SKProduct *product in response.products) {
            [self.productsArray addObject:product];
        }
    } else {
        NSLog(@"Apparently, there are no products available.");
    }
}

- (IBAction)buy25Pressed:(id)sender {
    
}

- (IBAction)buy100Pressed:(id)sender {
    
}

- (IBAction)buy500Pressed:(id)sender {
    
}

- (IBAction)removeAdsPressed:(id)sender {
    
}

- (IBAction)goBackPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
