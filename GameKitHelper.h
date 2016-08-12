//
//  GameKitHelper.h
//  82
//
//  Created by Andrea Gottardo on 2/12/16.
//  Copyright © 2016 Andrea Gottardo. All rights reserved.
//

#import <Foundation/Foundation.h>
@import GameKit;

extern NSString *const PresentAuthenticationViewController;

@interface GameKitHelper : NSObject

@property (nonatomic, readonly) UIViewController *authenticationViewController;
@property (nonatomic, readonly) NSError *lastError;

- (void)authenticateLocalPlayer;

+ (instancetype)sharedGameKitHelper;

@end
