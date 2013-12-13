//
//  GameControllerModel.m
//  CardGame
//
//  Created by Rahul Agrawal on 10/12/13.
//  Copyright (c) 2013 Rahul Agrawal. All rights reserved.
//

#import "GameControllerModel.h"
#import "GameGame.h"
#import "PlayingCard.h"

@interface GameControllerModel()

@property (strong,nonatomic) NSMutableArray *activeCards;
@property (strong,nonatomic) NSMutableArray *states;
@property (strong,nonatomic) GameGame *game;

@end

@implementation GameControllerModel

- (id)initWithSize:(NSUInteger)size andDeck:(Deck *)deck {
    self = [super init];
    
    BOOL wasSetUpSuccess = [self setUpActiveCardsWithSize:size deck:deck];
    return wasSetUpSuccess ? self : nil;
}

- (NSUInteger)maxSteps {
    return [self.states count];
}

- (NSMutableArray *)oldGameAtState:(NSUInteger)state {
    NSMutableArray *oldState = [[NSMutableArray alloc] init];
    for (int i =0 ;i<self.activeCards.count;i++){
        PlayingCard *oldCard = (PlayingCard *)self.activeCards[i];
        PlayingCard *card  = [[PlayingCard alloc] init];
        card.rank = oldCard.rank;
        card.suit = oldCard.suit;
        [oldState addObject:card];
    }
    for(int i =0;i<state;i++){
        [self flipCardAtIndex:[self.states[i] intValue] inCardsArray:oldState];
    }
    return oldState;
}

- (NSMutableArray *)states {
    if(!_states){
        _states = [[NSMutableArray alloc] init];
    }
    return _states;
}

- (BOOL)setUpActiveCardsWithSize:(NSUInteger)size deck:(Deck *)deck {
    _activeCards = [[NSMutableArray alloc] init];
    for (int i=0; i<size; i++) {
        Card *card = [deck drawRandomCard];
        if(card){
            [_activeCards addObject:card];
        }else{
            return NO;
        }
    }
    _game = [[GameGame alloc]init];
    return YES;
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return [self.activeCards objectAtIndex:index];
}

- (void)flipCardAtIndex:(NSUInteger)index {
    [self flipCardAtIndex:index inCardsArray:self.activeCards];
    [self.states addObject:@(index)];
}

- (void)flipCardAtIndex:(NSUInteger)index inCardsArray:(NSMutableArray *)array {
    Card *card = [array objectAtIndex:index];
    int score = 0;
    int penalty = -1;
    NSUInteger matchingCardLocation =0;
    if(!card.isFaceUp){
        for(Card *testCard in array){
            if(testCard.isFaceUp && !testCard.isUnplayable){
                self.score +=penalty;
                score = [card match:@[testCard]];
                if(score>0){
                    matchingCardLocation = (NSUInteger)[array indexOfObject:testCard];
                    break;
                }
            }
        }
        if(score>0){
            card.unPlayable = TRUE;
            Card *matchingCard = [array objectAtIndex:matchingCardLocation];
            matchingCard.unPlayable = TRUE;
            [self.game setScore:score];
        }
    }
    self.score +=score;
    card.faceUp = !card.isFaceUp;
}

@end
