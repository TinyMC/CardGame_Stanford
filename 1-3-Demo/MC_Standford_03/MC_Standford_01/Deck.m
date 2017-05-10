//
//  Deck.m
//  MC_Standford_01
//
//  Created by tiny on 17/5/1.
//  Copyright © 2017年 Tiny. All rights reserved.
//

#import "Deck.h"

//认识私有属性和方法设置
@interface Deck()
  //创建一个可变数组
@property (strong,nonatomic)NSMutableArray *cards;
@end



@implementation Deck

- (NSMutableArray *)cards{
    //认识懒加载，在程序init时才创建所需要的对象
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}


- (void)addCard:(Card *)card{
    [self addCard:card atTop:NO];
}


- (void)addCard:(Card *)card atTop:(BOOL)atTop{
    //如果有说明则加入放在牌堆最上面，否则放在牌堆最下面
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}

- (Card *)drawRandowCard{
    Card *randowCard = nil;
    
    //随机生成一张牌且返回，并从牌堆删除这一张牌
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randowCard = self.cards[index];
        //[self.cards removeObject:randowCard];
        [self.cards removeObjectAtIndex:index];
    }
    return randowCard;
}

@end
