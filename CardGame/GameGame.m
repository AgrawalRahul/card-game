//
//  GameGame.m
//  CardGame
//
//  Created by Rahul Agrawal on 11/12/13.
//  Copyright (c) 2013 Rahul Agrawal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameGame.h"

@interface GameGame()

@property (strong,readwrite,nonatomic) NSDate *start;
@property (strong,readwrite, nonatomic) NSDate *end;

@end

@implementation GameGame

-(id)init {
    self = [super init];
    if(self){
        _start = [NSDate date];
        _end = _start;
        _score = 0;
    }
    return self;
}

#define GAME_KEY @"CardGameKey"
#define START @"start"
#define END @"end"
#define SCORE   @"score"

+(NSMutableArray *)allGames {
    NSMutableArray *allGames = [[NSMutableArray alloc] init];
    for(NSDictionary *dic in [[[NSUserDefaults standardUserDefaults] dictionaryForKey:GAME_KEY] allValues]){
        [allGames addObject:[[GameGame alloc] initFromPropertyList:dic]];
    }
    return allGames;
}

- (id)initFromPropertyList:(id)data {
    self = [super init];
    if([data isKindOfClass:[NSDictionary class]]){
        NSDictionary *dic = (NSDictionary *)data;
        _start = dic[START];
        _end = dic[END];
        _score = (int)dic[SCORE];
    }
    return self;
}

- (void)sychronizeInMemory {
    NSMutableDictionary *dic = [[[NSUserDefaults standardUserDefaults] dictionaryForKey:GAME_KEY] mutableCopy];
    if(!dic){
        dic = [[NSMutableDictionary alloc] init];
    }
    dic[[self.start description]] = [self propertyList];
    [[NSUserDefaults standardUserDefaults] setObject:dic forKey:GAME_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSDictionary *)propertyList {
    return @{START:self.start, END:self.end, SCORE:@(self.score)};
}

-(void)setScore:(int)score {
    _score = score;
    self.end = [NSDate date];
    [self sychronizeInMemory];
}

- (NSTimeInterval)period {
    return [self.end timeIntervalSinceDate:self.start];
}

@end
