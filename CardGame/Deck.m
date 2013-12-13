//
//  CardDeck.m
//  CardGame
//
//  Created by Rahul Agrawal on 06/12/13.
//  Copyright (c) 2013 Rahul Agrawal. All rights reserved.


#import "Deck.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards; //array of cards. Implementation is hidden

@end

@implementation Deck

- (NSMutableArray *)cards {
    if(!_cards){
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (Card *)drawRandomCard {
    Card *card;
    if (self.cards){
        int index = arc4random() % self.cards.count;
        card = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return card;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop {
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}


@end
