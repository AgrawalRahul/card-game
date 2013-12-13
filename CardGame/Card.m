//
//  Card.m
//  CardGame
//
//  Created by Rahul Agrawal on 06/12/13.
//  Copyright (c) 2013 Rahul Agrawal. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards {
    int score = 0;
    for(Card *card in otherCards){
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    return score;
}

@end
