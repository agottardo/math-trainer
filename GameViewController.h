//
//  GameViewController.h
//  MathTrainer
//
//  Created by Andrea Gottardo on 2/11/16.
//  Copyright © 2016 Andrea Gottardo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MathBrain.h"
@import AVFoundation;
@import iAd;

@interface GameViewController : UIViewController <AVAudioPlayerDelegate, ADBannerViewDelegate> {
    MathBrain *mathBrain;
    NSMutableArray *quest;
    int actualAnswer;
    int currentScore;
    __weak IBOutlet UILabel *scoreLabel;
    __weak IBOutlet UILabel *questionBox;
    __weak IBOutlet UIButton *answer1;
    __weak IBOutlet UIButton *answer2;
    __weak IBOutlet UIButton *answer3;
    __weak IBOutlet UIButton *answer4;
    NSTimer *secondsTimer;
    __weak IBOutlet UIView *gameoverView;
    int seconds;
    int secondsLeft;
    __weak IBOutlet UILabel *countdownView;
    NSTimer *timer;
    SystemSoundID *okSound;
    SystemSoundID *wrongSound;
    AVAudioPlayer *myAudio;
    NSTimeInterval interval;
}

-(void)updateCounter:(NSTimer *)theTimer;
-(void)countdownTimer;



@end

