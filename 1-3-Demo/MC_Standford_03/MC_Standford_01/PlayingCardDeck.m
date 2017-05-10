//
//  PlayingCardDeck.m
//  MC_Standford_01
//
//  Created by tiny on 17/5/2.
//  Copyright © 2017年 Tiny. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

//自定义初始化一副完整的牌 注意使用的类型instancetype而不是id类型
- (instancetype)init{
    self = [super init];
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    
    return self;
    
}

@end
