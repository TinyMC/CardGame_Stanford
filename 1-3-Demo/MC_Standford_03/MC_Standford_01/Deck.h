//
//  Deck.h
//  MC_Standford_01
//
//  Created by tiny on 17/5/1.
//  Copyright © 2017年 Tiny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

//认识NSMutableArray可变数组，以及认识懒加载(在程序init最后一刻加载自己需要的“东西”)

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;//算重载？


//从牌堆里抓取一张牌
- (Card *)drawRandowCard;



@end
