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
- (instancetype)initWithFrame:(CGRect)frame With:(int)Max And:(int)Min {
   if(self = [super initWithFrame:frame])
   {
       max = Max;
       min = Min;
       
       currentNum = Min;
       
       float w = self.frame.size.width;
       float h = self.frame.size.height;
       
       float btnW = 20;
       float labelW = 40;
       //-
       self.decBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btnW, h)];
       [self addSubview:self.decBtn];
       [self.decBtn setTitle:@"-" forState:UIControlStateNormal];
       [self.decBtn addTarget:self action:@selector(onDec:) forControlEvents:UIControlEventTouchUpInside];
       [self.decBtn setBackgroundColor:[UIColor cyanColor]];
       
       //=
       self.resultLb = [[UILabel alloc] initWithFrame:CGRectMake(btnW, 0, labelW, h)];
       [self addSubview:self.resultLb];
       self.resultLb.backgroundColor = [UIColor whiteColor];
       _resultLb.text = [NSString stringWithFormat:@"%d",currentNum];
       [self addSubview:_resultLb];
       _resultLb.textColor = [UIColor blackColor];
       
       
       //+
       self.addBtn = [[UIButton alloc] initWithFrame:CGRectMake(btnW + labelW, 0, btnW, h)];
       [self addSubview:self.addBtn];
       [self.addBtn addTarget:self action:@selector(onAdd:) forControlEvents:UIControlEventTouchUpInside];
       [self.addBtn setTitle:@"+" forState:UIControlStateNormal];
       [self.addBtn setBackgroundColor:[UIColor cyanColor]];
       
       _buttonClickBlock = nil;
   }
    return self;
}

- (void)onDec:(UIButton *)btn
{
    currentNum --;
    if (currentNum < min) {
        currentNum = min;
    }
    self.resultLb.backgroundColor = [UIColor whiteColor];
    _resultLb.text = [NSString stringWithFormat:@"%d",currentNum];
    [self.resultLb reloadInputViews];
    
    if (_buttonClickBlock != nil) {
        _buttonClickBlock(currentNum);
    }
}

- (void)onAdd:(UIButton *)btn
{
    currentNum ++;
    if (currentNum > max) {
        currentNum = max;
    }
    self.resultLb.backgroundColor = [UIColor whiteColor];
    _resultLb.text = [NSString stringWithFormat:@"%d",currentNum];
    [self.resultLb reloadInputViews];
    
    if (_buttonClickBlock != nil) {
        _buttonClickBlock(currentNum);
    }
}





@end
