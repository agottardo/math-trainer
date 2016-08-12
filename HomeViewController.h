//
//  HomeViewController.h
//  83
//
//  Created by Andrea Gottardo on 2/12/16.
//  Copyright © 2016 Andrea Gottardo. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GameKit;

@interface HomeViewController : UIViewController <GKGameCenterControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *gameCButton;
@property (weak, nonatomic) IBOutlet UILabel *copyrightText;
@property GKGameCenterViewController *gameCenterController;
@end
