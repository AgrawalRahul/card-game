//
//  GameGame.h
//  CardGame
//
//  Created by Rahul Agrawal on 11/12/13.
//  Copyright (c) 2013 Rahul Agrawal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameGame : NSObject

@property (strong,readonly,nonatomic) NSDate *start;
@property (strong,readonly, nonatomic) NSDate *end;
@property (nonatomic) int score;

- (NSTimeInterval)period;

+ (NSMutableArray *)allGames;

@end
