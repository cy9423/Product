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
       
       float w = frame.size.width;
       float h = frame.size.height;
    
       //-
       self.decBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, w / 4.0, h)];
       [self addSubview:self.decBtn];
       [self.decBtn setTitle:@"-" forState:UIControlStateNormal];
       [self.decBtn addTarget:self action:@selector(onDec:) forControlEvents:UIControlEventTouchUpInside];
       [self.decBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
       [self.decBtn setBackgroundColor:[UIColor whiteColor]];
       self.decBtn.layer.masksToBounds = YES;
       self.decBtn.layer.borderWidth = 1.0;
       self.decBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
       
       //=
       self.resultLb = [[UILabel alloc] initWithFrame:CGRectMake(w / 4.0, 0, w / 2.0, h)];
       [self addSubview:self.resultLb];
       self.resultLb.backgroundColor = [UIColor whiteColor];
       _resultLb.text = [NSString stringWithFormat:@"%d",currentNum];
       [self addSubview:_resultLb];
       _resultLb.textColor = [UIColor blackColor];
       _resultLb.textAlignment = NSTextAlignmentCenter;
       
       //+
       self.addBtn = [[UIButton alloc] initWithFrame:CGRectMake(w * 3 / 4, 0, w / 4.0, h)];
       [self addSubview:self.addBtn];
       [self.addBtn addTarget:self action:@selector(onAdd:) forControlEvents:UIControlEventTouchUpInside];
       [self.addBtn setTitle:@"+" forState:UIControlStateNormal];
       [self.addBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
       [self.addBtn setBackgroundColor:[UIColor whiteColor]];
       self.addBtn.layer.masksToBounds = YES;
       self.addBtn.layer.borderWidth = 1.0;
       self.addBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
       
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
    _resultLb.text = [NSString stringWithFormat:@"%d",currentNum];
    
    if (_buttonClickBlock != nil) {
        _buttonClickBlock(currentNum);
    }
    
    [self.delegate reserveNumChanged:self.resultLb.text];
}

- (void)onAdd:(UIButton *)btn
{
    currentNum ++;
    if (currentNum > max) {
        currentNum = max;
    }
    
    _resultLb.text = [NSString stringWithFormat:@"%d",currentNum];
    
    if (_buttonClickBlock != nil) {
        _buttonClickBlock(currentNum);
    }
    
    [self.delegate reserveNumChanged:self.resultLb.text];
}





@end
