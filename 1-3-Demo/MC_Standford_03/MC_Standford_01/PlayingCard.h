//
//  PlayingCard.h
//  MC_Standford_01
//
//  Created by tiny on 17/5/1.
//  Copyright © 2017年 Tiny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

//学习OC的继承
@interface PlayingCard : Card

//本类主要用于认识类方法
@property (strong,nonatomic)NSString *suit;
@property (nonatomic)NSUInteger rank;

//认识类方法
//1.纸牌大写从A--->K
+ (NSArray *)rankStrings;
//2.纸牌颜色
+ (NSArray *)validSuits;
//3.返回牌纸面数字最大下标
+ (NSUInteger)maxRank;




@end
