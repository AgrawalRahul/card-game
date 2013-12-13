//
//  GameScoreViewController.m
//  CardGame
//
//  Created by Rahul Agrawal on 11/12/13.
//  Copyright (c) 2013 Rahul Agrawal. All rights reserved.
//

#import "GameScoreViewController.h"
#import "GameGame.h"

@interface GameScoreViewController ()

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation GameScoreViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self updateUI];
}

- (void)updateUI {
    NSString *displayText = NSLocalizedString(@"data", @"hey translator this was the context behind this word or phrase");
    for(GameGame *game in [GameGame allGames]){
        displayText = [displayText stringByAppendingFormat:@"Score : %d (%@, %fs)\n",game.score,game.start,round(game.period)];
    }
    self.scoreLabel.text =displayText;
}

//TODO sorting need to be done..
- (IBAction)sortByTime {
}

- (IBAction)sortByScore {
}
- (IBAction)sortByDuration {
}

@end
