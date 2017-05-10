//
//  ViewController.m
//  MC_Standford_01
//
//  Created by tiny on 17/4/30.
//  Copyright © 2017年 Tiny. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "Card.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (nonatomic) int flipsCount;
//创建一个牌堆用于获取随机牌(大小及花色)
@property (nonatomic,strong) Deck *deck;
@property (nonatomic,strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation ViewController


//懒加载
- (CardMatchingGame *)game{
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] //指定参与游戏的排数(12张？)
        usingDeck:[self createDeck]];
    return _game;
}

//通过懒加载初始化一副牌堆
- (Deck *)deck{
    if (!_deck) _deck = self.createDeck;
    return _deck;
}

- (Deck *) createDeck{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)touchCarButton:(UIButton *)sender {
    int choosenButtonIndex = [self.cardButtons indexOfObject:sender];  //获取选中牌的下标
    NSLog(@"11");
    [self.game chooseCardAtIndex:choosenButtonIndex]; //通过传入选中牌下标调用封装的Model类里的游戏逻辑(得分及card和otherCard的view变化)
    NSLog(@"----begin----");
    [self updateUI];
    NSLog(@"-----end----");
    
}

- (void)updateUI{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroudImageForCard:card] forState:UIControlStateNormal];
        NSLog(@"end?---");
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"分数:%ld",(long)self.game.score];
    }
}

- (NSString *)titleForCard:(Card *)card{
    return card.isChonsen ? card.contents :@"";
}

- (UIImage *)backgroudImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChonsen ? @"cardFront" :@"cardBack"];
}








@end
