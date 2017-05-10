//
//  Card.h
//  MC_Standford_01
//
//  Created by tiny on 17/4/30.
//  Copyright © 2017年 Tiny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString *contents;
@property (nonatomic,getter=isChonsen) BOOL chonsen;
@property (nonatomic,getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
