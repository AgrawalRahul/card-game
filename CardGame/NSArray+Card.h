//
//  NSArray+Card.h
//  CardGame
//
//  Created by Rahul Agrawal on 13/12/13.
//  Copyright (c) 2013 Rahul Agrawal. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Card;

@interface NSArray (Card)

- (BOOL)containsCard:(Card *)card;

@end
