//
//  MarketViewController.h
//  82
//
//  Created by Andrea Gottardo on 4/10/16.
//  Copyright © 2016 Andrea Gottardo. All rights reserved.
//

#import <UIKit/UIKit.h>
@import StoreKit;

@interface MarketViewController : UIViewController <SKProductsRequestDelegate>
@property (weak, nonatomic) IBOutlet UIButton *buy25;
@property (weak, nonatomic) IBOutlet UIButton *buy100;
@property (weak, nonatomic) IBOutlet UIButton *buy500;
@property (weak, nonatomic) IBOutlet UIButton *removeAdsButton;
@property NSMutableArray *productIDs;
@property NSMutableArray *productsArray;

@end
