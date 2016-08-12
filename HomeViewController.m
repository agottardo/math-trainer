//
//  HomeViewController.m
//  83
//
//  Created by Andrea Gottardo on 2/12/16.
//  Copyright © 2016 Andrea Gottardo. All rights reserved.
//

#import "HomeViewController.h"
#import "GameKitHelper.h"
@import GameKit;

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // graphics setup
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.bounds;
    gradientLayer.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:255.0f/255.0f green:153.0f/255.0f blue:0.0f/255.0f alpha:1] CGColor], (id)[[UIColor colorWithRed:255.0f/255.0f green:102.0f/255.0f blue:51.0f/255.0f alpha:1] CGColor], nil];
    [self.view.layer insertSublayer:gradientLayer atIndex:0];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(showAuthenticationViewController)
     name:PresentAuthenticationViewController
     object:nil];
    
    [[GameKitHelper sharedGameKitHelper] authenticateLocalPlayer];
    
    // Do any additional setup after loading the view.
}
- (IBAction)showLeaderboard:(id)sender {
    NSString *leaderboardID = @"topplayers";
    self.gameCenterController = [[GKGameCenterViewController alloc] init];
    if (self.gameCenterController != nil)
    {
        self.gameCenterController.gameCenterDelegate = self;
        self.gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
        self.gameCenterController.leaderboardTimeScope = GKLeaderboardTimeScopeToday;
        self.gameCenterController.leaderboardCategory = leaderboardID;
        [self presentViewController: self.gameCenterController animated: YES completion:nil];
    }
}

- (void)showAuthenticationViewController
{
    GameKitHelper *gameKitHelper = [GameKitHelper sharedGameKitHelper];
    
    [self presentViewController: gameKitHelper.authenticationViewController animated:YES completion:nil];
}



-(void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController{
    [self.gameCenterController dismissViewControllerAnimated:YES completion:^{
        
    }];
    
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
