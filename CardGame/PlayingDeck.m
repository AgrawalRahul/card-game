//
//  PlayingDeck.m
//  CardGame
//
//  Created by Rahul Agrawal on 06/12/13.
//  Copyright (c) 2013 Rahul Agrawal. All rights reserved.
//

#import "PlayingDeck.h"
#import "PlayingCard.h"

@implementation PlayingDeck

- (id)init {
    self = [super init];
    if(self){
        for(NSString *suit in [PlayingCard allSuits]){
            for(NSUInteger i = 1;i<=[PlayingCard allRanks].count-1;i++){
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = i;
                //The line below should be there in playing card? it is not there in video.
                [self addCard:card atTop:false];
            }
        }
    }
    return self;
}

@end
