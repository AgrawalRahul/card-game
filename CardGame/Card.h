//
//  Card.h
//  CardGame
//
//  Created by Rahul Agrawal on 06/12/13.
//  Copyright (c) 2013 Rahul Agrawal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, strong) NSString *contents;
@property (nonatomic, getter = isFaceUp) BOOL faceUp;
@property (nonatomic, getter = isUnplayable) BOOL unPlayable;

- (int)match:(NSArray *)otherCards;

@end
