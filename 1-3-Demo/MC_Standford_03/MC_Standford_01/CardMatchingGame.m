//
//  CardMatchingGame.m
//  MC_Standford_01
//
//  Created by tiny on 17/5/7.
//  Copyright © 2017年 Tiny. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards;
@end

@implementation CardMatchingGame

//懒加载
- (NSMutableArray *)cards{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

//自定义初始化方法
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    
    if (self){
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandowCard];
            if (card){
                [self.cards addObject:card];
            }else {
                self = nil;
                break;
            }
            
        }
    }
    
    return  self;
    
}

- (Card *)cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

static const int MISMATCH_SCORE = 2;//没有匹配时扣分
static const int MATCH_SCORE = 4;//匹配时得分
static const int CONST_SCORE = 1;//翻拍消耗分


//封装游戏类的主要逻辑在choosenCardAtIndex:(NSUInteger)index方法里  这里事先搞清楚card 和otherCard
-(void)chooseCardAtIndex:(NSUInteger)index{
    //选中的牌
    Card *card = self.cards[index];
    NSLog(@"---进入游戏逻辑---");
    if (!card.isMatched){
        if(card.isChonsen){   //通过下标选中一张牌后把这张牌的chonse置为NO(也就是未被选中)
            card.chonsen = NO;
        }else{
            //和其他牌比较
            for (Card *otherCard in self.cards) {
                if (otherCard.isChonsen && !otherCard.isMatched) {
                    NSLog(@"1.游戏逻辑----");
                    int matchScore = [card match:@[otherCard]];
                    NSLog(@"2.游戏逻辑----");
                    if (matchScore){
                        NSLog(@"3.游戏逻辑----");
                        self.score += matchScore*MATCH_SCORE;
                        otherCard.matched = YES;
                        card.matched = YES;
                    }else{
                        NSLog(@"4.游戏逻辑----");
                        self.score -= MISMATCH_SCORE;
                        otherCard.chonsen = NO;
                    }
                    break;
                }
            }
            
            self.score -= CONST_SCORE;//翻牌的销售分
            card.chonsen = YES;
        }
    }
    
    
}

@end
