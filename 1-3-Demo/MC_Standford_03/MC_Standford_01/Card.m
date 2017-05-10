//
//  Card.m
//  MC_Standford_01
//
//  Created by tiny on 17/4/30.
//  Copyright © 2017年 Tiny. All rights reserved.
//

#import "Card.h"

@implementation Card


//@synthesize contents = _contents;
//@synthesize chonsen  = _chonsen;
//@synthesize matched  = _matched;
//
//- (NSString *)contents{
//    return _contents;
//}
//
//- (void)setContents:(NSString *)contents{
//    _contents = contents;
//}
//
//
//- (BOOL)isChonsen{
//    return _chonsen;
//}
//
//- (void)setChonsen:(BOOL)chonsen{
//    _chonsen = chonsen;
//}
//
//
//- (BOOL)isMatched{
//    return _matched;
//}
//
//- (void)setMatched:(BOOL)matched{
//    _matched = matched;
//}


//学习for in 循环语法
-(int)match:(NSArray *)otherCards{
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}



@end
