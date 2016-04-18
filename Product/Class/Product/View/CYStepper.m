//
//  CYStepper.m
//  Product
//
//  Created by cy on 16/4/18.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "CYStepper.h"

@interface CYStepper()
{
    int max;
    int min;
    int currentNum;
}

@end

@implementation CYStepper

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame With:(int)Max And:(int)Min
{
   if(self = [super initWithFrame:frame])
   {
       max = Max;
       min = Min;
       
       currentNum = Min;
       
       float w = self.frame.size.width;
       float h = self.frame.size.height;
       
       float btnW = 40;
       
       //-
       self.decBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btnW, h)];
       [self addSubview:self.decBtn];
       [self.decBtn setTitle:@"-" forState:UIControlStateNormal];
       [self.decBtn addTarget:self action:@selector(onDec:) forControlEvents:UIControlEventTouchUpInside];
       //+
       self.addBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btnW, h)];
       [self addSubview:self.addBtn];
       [self.addBtn addTarget:self action:@selector(onAdd:) forControlEvents:UIControlEventTouchUpInside];
       [self.addBtn setTitle:@"+" forState:UIControlStateNormal];
       //=
       self.resultLb = [[UILabel alloc] initWithFrame:CGRectMake(w - btnW, 0, (w - btnW * 2), h)];
       [self addSubview:self.resultLb];
       _resultLb.text = [NSString stringWithFormat:@"%d",currentNum];
   }
    return self;
}

- (void)onDec:(UIButton *)btn
{
    currentNum --;
    if (currentNum < min) {
        currentNum = min;
    }
}

- (void)onAdd:(UIButton *)btn
{
    currentNum ++;
    if (currentNum > max) {
        currentNum = max;
    }
}





@end
