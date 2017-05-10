//
//  CardMatchingGame.h
//  MC_Standford_01
//
//  Created by tiny on 17/5/7.
//  Copyright © 2017年 Tiny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

//设计一个类封装游戏的逻辑
@interface CardMatchingGame : NSObject


//初始化封装类CardMathingGame 参数指定游戏的牌数 和牌堆
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

//通过下标选中牌
- (void)chooseCardAtIndex:(NSUInteger)index;

//通过下标返回一张牌
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic,readonly) NSInteger score;

@end
