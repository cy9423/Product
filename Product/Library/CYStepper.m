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
       
       self.layer.masksToBounds = YES;
       self.layer.cornerRadius = h / 4.0;
       self.layer.borderWidth = 1.0;
       self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
       //-
       self.decBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, h, h)];
       [self.decBtn setTitle:@"-" forState:UIControlStateNormal];
       [self.decBtn addTarget:self action:@selector(onDec:) forControlEvents:UIControlEventTouchUpInside];
       [self.decBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
       [self.decBtn setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
       
       //=
       self.resultLb = [[UILabel alloc] initWithFrame:CGRectMake(h , 0, w - h *2, h)];
       self.resultLb.backgroundColor = [UIColor whiteColor];
       _resultLb.text = [NSString stringWithFormat:@"%d",currentNum];
       _resultLb.textColor = [UIColor blackColor];
       _resultLb.textAlignment = NSTextAlignmentCenter;
       
       //+
       self.addBtn = [[UIButton alloc] initWithFrame:CGRectMake(w - h, 0, h, h)];
       [self.addBtn addTarget:self action:@selector(onAdd:) forControlEvents:UIControlEventTouchUpInside];
       [self.addBtn setTitle:@"+" forState:UIControlStateNormal];
       [self.addBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
       [self.addBtn setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
       self.addBtn.layer.masksToBounds = YES;
       
       [self addSubview:self.decBtn];
       [self addSubview:self.addBtn];
       [self addSubview:self.resultLb];
   }
    return self;
}

- (void)onDec:(UIButton *)btn {
    currentNum --;
    if (currentNum <= min) {
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        currentNum = min;
    }else{
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        [_addBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_addBtn setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    }
    _resultLb.text = [NSString stringWithFormat:@"%d",currentNum];
    [self.delegate reserveNumChanged:currentNum];
}

- (void)onAdd:(UIButton *)btn {
    currentNum ++;
    if (currentNum >= max) {
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        currentNum = max;
    }else{
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        [_decBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_decBtn setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    }
    _resultLb.text = [NSString stringWithFormat:@"%d",currentNum];
    [self.delegate reserveNumChanged:currentNum];
}

- (void)layoutSubviews{
    if (currentNum == min) {
        [_decBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_decBtn setBackgroundColor:[UIColor lightGrayColor]];
    }else if (currentNum == max){
        [_addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_addBtn setBackgroundColor:[UIColor lightGrayColor]];
    }
}
@end
