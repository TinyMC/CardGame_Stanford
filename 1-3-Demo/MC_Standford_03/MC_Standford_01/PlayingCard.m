//
//  PlayingCard.m
//  MC_Standford_01
//
//  Created by tiny on 17/5/1.
//  Copyright © 2017年 Tiny. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

//重写父类Card的match方法
- (int)match:(NSArray *)otherCards{
    
    int score = 0;
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards firstObject];  //获取传入数组的牌对象
        if (otherCard.rank == self.rank) {
            score = 4;
        }else if([otherCard.suit isEqualToString:self.suit]){
            score = 1;
        }
    }
    
    return score;
}

//oc重写父类Card的contents的getter方法
- (NSString *)contents{
    
    //return [NSString stringWithFormat:@"%d%@",self.rank,self.suit];
    
    //声明一个数组
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];

}

+ (NSArray *)rankStrings{
    //声明不可变数组
   return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSArray *)validSuits{
    return @[@"♠︎",@"♥︎",@"♣︎",@"♦︎"];
}


//如果把setter和getter方法都重写需要锁定属性值
@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

//重写suit的getter方法 替换如果_suit为nil时返回@“？”
- (NSString *)suit{
    return _suit ? _suit :@"?";
}


+ (NSUInteger)maxRank{
    //返回数组最大下标
    return [[self rankStrings] count] -1;
}

//控制返回牌纸面最大数字 放崩溃
- (void)setRank:(NSUInteger)rank{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
    
}




@end
