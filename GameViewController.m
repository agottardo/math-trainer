//
//  GameViewController.m
//  MathTrainer
//
//  Created by Andrea Gottardo on 2/11/16.
//  Copyright © 2016 Andrea Gottardo. All rights reserved.
//

#import "GameViewController.h"
#import "MathBrain.h"
@import AVFoundation;
@import GameKit;

@implementation GameViewController

-(void)playSound:(NSString*)soundName{
    NSString *path = [[NSBundle mainBundle] pathForResource:soundName ofType:@"m4a"];
    myAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
    myAudio.delegate = self;
    myAudio.volume = 2.0;
    myAudio.numberOfLoops = 0;
    [myAudio play];
}

- (void)viewDidLoad {
    
    // graphics setup
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.bounds;
    gradientLayer.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:255.0f/255.0f green:153.0f/255.0f blue:0.0f/255.0f alpha:1] CGColor], (id)[[UIColor colorWithRed:255.0f/255.0f green:102.0f/255.0f blue:51.0f/255.0f alpha:1] CGColor], nil];
    [self.view.layer insertSublayer:gradientLayer atIndex:0];
    
    currentScore = 20;
    [super viewDidLoad];
    mathBrain = [[MathBrain alloc] init];
    
    secondsLeft = 83000;
    [self countdownTimer];
    
    [self startGame];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)startGame {
    quest = [mathBrain generateQuestWithDifficultyLevel:0];
    NSString *questionString = quest[0];
    [questionBox setText:questionString];
    
    // secondsTimer = [NSTimer scheduledTimerWithTimeInterval:1 target: selector:@selector(timerFireMethod:) userInfo:nil repeats:true];
    
    actualAnswer = [quest[1] intValue];
    NSMutableArray *answers = [[NSMutableArray alloc] initWithObjects:quest[1], quest[2], quest[3], quest[4], nil];
    // We need to randomize the order of the presented answers.
    NSUInteger count = [answers count];
    for (uint i = 0; i < count - 1; ++i)
    {
        // Select a random element between i and end of array to swap with.
        int nElements = count - i;
        int n = arc4random_uniform(nElements) + i;
        [answers exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    [answer1 setTitle:[NSString stringWithFormat:@"%@", answers[0]] forState:UIControlStateNormal];
    [answer2 setTitle:[NSString stringWithFormat:@"%@", answers[1]] forState:UIControlStateNormal];
    [answer3 setTitle:[NSString stringWithFormat:@"%@", answers[2]] forState:UIControlStateNormal];
    [answer4 setTitle:[NSString stringWithFormat:@"%@", answers[3]] forState:UIControlStateNormal];
}

- (BOOL)answeredWith:(int)providedAnswer{
    if (providedAnswer == actualAnswer) {
        [self playSound:@"ok"];
        // self.view.backgroundColor = [UIColor greenColor];
        currentScore = currentScore + 5;
        [scoreLabel setText:[NSString stringWithFormat:@"%d", currentScore]];
        [self startGame];
        return true;
    } else {
        [self playSound:@"wrong"];
        // self.view.backgroundColor = [UIColor redColor];
        currentScore = currentScore - 20;
        [scoreLabel setText:[NSString stringWithFormat:@"%d", currentScore]];
        if (currentScore < 0) {
            [self stopGame];
        } else {
            [self startGame];
        }
        return false;
    }
}

-(void)stopGame{
    // stop the game!
    [timer invalidate];
    [self playSound:@"gameover"];
    [gameoverView setHidden:false];
    [answer1 setEnabled:false];
    [answer2 setEnabled:false];
    [answer3 setEnabled:false];
    [answer4 setEnabled:false];
    [self reportHighScore:currentScore];
    
}

- (void) reportHighScore:(NSInteger) highScore {
    if ([GKLocalPlayer localPlayer].isAuthenticated) {
        GKScore* score = [[GKScore alloc] initWithLeaderboardIdentifier:@"topplayers"];
        score.value = highScore;
        [GKScore reportScores:@[score] withCompletionHandler:^(NSError *error) {
            if (error) {
                // handle error
            }
        }];
    }
}

- (void)updateCounter:(NSTimer *)theTimer {
    if(seconds > 0 ) {
        seconds--;
        countdownView.text = [NSString stringWithFormat:@"%02d", seconds];
    } else {
        [self stopGame];
    }
}

-(void)countdownTimer {
    
    seconds = 83;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
}

- (IBAction)didPressFirstButton:(id)sender {
    UIButton *senderButton = sender;
    NSString *answerOnButton = senderButton.titleLabel.text;
    [self answeredWith:[answerOnButton intValue]];
}
- (IBAction)didPressSecondButton:(id)sender {
    UIButton *senderButton = sender;
    NSString *answerOnButton = senderButton.titleLabel.text;
    [self answeredWith:[answerOnButton intValue]];
}
- (IBAction)didPressThirdButton:(id)sender {
    UIButton *senderButton = sender;
    NSString *answerOnButton = senderButton.titleLabel.text;
    [self answeredWith:[answerOnButton intValue]];
}
- (IBAction)didPressFourthButton:(id)sender {
    UIButton *senderButton = sender;
    NSString *answerOnButton = senderButton.titleLabel.text;
    [self answeredWith:[answerOnButton intValue]];
}
- (IBAction)didPressQuitGameButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave{
    [timer invalidate];
    return true;
}

-(void)bannerViewActionDidFinish:(ADBannerView *)banner{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
