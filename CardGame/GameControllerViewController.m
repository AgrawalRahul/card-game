//
//  GameControllerViewController.m
//  CardGame
//
//  Created by Rahul Agrawal on 05/12/13.
//  Copyright (c) 2013 Rahul Agrawal. All rights reserved.
//

#import "GameControllerViewController.h"
#import "Deck.h"
#import "PlayingDeck.h"
#import "GameControllerModel.h"
#import "GameGame.h"

@interface GameControllerViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
@property (weak, nonatomic) IBOutlet UILabel *flipCount;
@property (weak, nonatomic) IBOutlet UISwitch *flipper;

@property (strong, nonatomic) GameControllerModel *model;

@end

@implementation GameControllerViewController

#pragma mark - View Lifecycle

- (GameControllerModel *)model {
    if(!_model) {
        _model = [[GameControllerModel alloc] initWithSize:[_buttons count]
                                                   andDeck:[[PlayingDeck alloc] init]];
    }
    return _model;
}
- (IBAction)reset {
    _model = nil;
    
    [self.flipper setEnabled:YES];
    [self recreateUI];
}

- (IBAction)slide:(id)sender {
    UISlider *slider = (UISlider *)sender;
    double gameIndex = (slider.value * [self.model maxSteps]) / slider.maximumValue;
    [self reCreateOldUIatIndex:lround(gameIndex)];
}

- (void)setButtons:(NSArray *)buttons {
    _buttons = buttons;
    [self recreateUI];
}

- (IBAction)switchPushed:(id)sender {
    BOOL twoCardGame = ((UISwitch *)sender).on;
    NSLog(twoCardGame?@"on":@"off");
}

#pragma mark - Misc

- (void)reCreateOldUIatIndex:(NSUInteger)index {
    if(index == self.model.maxSteps){
        [self recreateUI];
    }else{
        NSMutableArray * oldGameCards = [self.model oldGameAtState:index];
        for(UIButton *button in self.buttons) {
            
            NSUInteger buttonIndex = [self.buttons indexOfObject:button];
            Card *card =(Card *)[oldGameCards objectAtIndex:buttonIndex];
            [button setTitle:[card contents] forState:UIControlStateSelected];
            [button setTitle:[card contents] forState:UIControlStateSelected |UIControlStateDisabled];
            button.selected = card.isFaceUp;
            button.enabled = NO;
            button.alpha = !card.unPlayable ? 0.7 : 0.3;
        }
    }
}

- (void)recreateUI {
    for (UIButton *button in self.buttons) {
        NSUInteger buttonIndex = [self.buttons indexOfObject:button];
        Card *card = [self.model cardAtIndex:buttonIndex];
        //        [button setImage:[UIImage imageNamed:@"1386792567_56-apple.png"]
        //                forState:UIControlStateNormal];
        [button setTitle:[card contents] forState:UIControlStateSelected];
        //        [button setImage:nil forState:UIControlStateSelected];
        [button setTitle:[card contents] forState:UIControlStateSelected | UIControlStateDisabled];// | UIControlStateDisabled)];
        //        [button setImage:nil forState:UIControlStateSelected | UIControlStateDisabled];
        button.selected = card.isFaceUp;
        button.enabled = !card.unPlayable;
    }
}

- (IBAction)onSelect:(UIButton *)sender {
    [self.flipper setEnabled:NO];
    [self.model flipCardAtIndex:[self.buttons indexOfObject:sender]];
    [self recreateUI];
}

@end
