//
//  CYStepper.h
//  Product
//
//  Created by cy on 16/4/18.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYStepper : UIView

@property (nonatomic,strong) UIButton *addBtn;
@property (nonatomic,strong) UIButton *decBtn;
@property (nonatomic,strong) UILabel *resultLb;

- (instancetype)initWithFrame:(CGRect)frame With:(int)Max And:(int)Min;

@end
