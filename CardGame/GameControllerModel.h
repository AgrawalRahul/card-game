//
//  GameControllerModel.h
//  CardGame
//
//  Created by Rahul Agrawal on 10/12/13.
//  Copyright (c) 2013 Rahul Agrawal. All rights reserved.
//

#import "Deck.h"

@interface GameControllerModel : NSObject

@property (nonatomic) NSInteger score; // TODO: NSInteger

- (id)initWithSize:(NSUInteger)size andDeck:(Deck *)deck;

- (NSUInteger)maxSteps;

- (NSMutableArray *)oldGameAtState:(NSUInteger)state;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@end
