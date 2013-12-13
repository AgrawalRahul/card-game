//
//  NSArray+Card.m
//  CardGame
//
//  Created by Rahul Agrawal on 13/12/13.
//  Copyright (c) 2013 Rahul Agrawal. All rights reserved.
//

#import "NSArray+Card.h"
#import "Card.h"

@implementation NSArray (Card)

- (BOOL)containsCard:(Card *)matchCard {
    BOOL didMatch;
    for(Card *card in self) {
        if([matchCard.contents isEqualToString:card.contents]){
            didMatch = YES;
        }
    }
    return didMatch;
}

@end
