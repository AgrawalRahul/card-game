//
//  PlayingCard.m
//  CardGame
//
//  Created by Rahul Agrawal on 06/12/13.
//  Copyright (c) 2013 Rahul Agrawal. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard ()

@end

@implementation PlayingCard

- (NSString *)contents {
    return [NSString stringWithFormat:@"%@%@",[PlayingCard allRanks][self.rank],self.suit];
}

+ (NSArray *)allRanks {
    return @[@"?",@"A",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"B",@"K"];
}

- (void)setRank:(NSUInteger)rank {
    if ([PlayingCard allRanks].count-1>=rank) {
        _rank = rank;
    }
}

@synthesize suit = _suit;

+ (NSArray *)allSuits {
    return @[@"A",@"B",@"C",@"D"];
}

- (void)setSuit:(NSString *) suit {
    if([[PlayingCard allSuits] containsObject:suit]){
        _suit = suit;
    }
}

- (NSString *)suit {
    return _suit?_suit:@"?";
}

- (int)match:(NSArray *)otherCards {
    int score = 0;
    if([otherCards count]==1){
        PlayingCard *otherCard = (PlayingCard *)[otherCards objectAtIndex:0];
        if([[otherCard suit] isEqualToString:self.suit]){
            score = 2;
        }else if([otherCard rank] == self.rank){
            score = 4;
        }
    }
    return score;
}

@end
