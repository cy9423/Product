//
//  CYStepper.h
//  Product
//
//  Created by cy on 16/4/18.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NumChangedDelegate <NSObject>

- (void)reserveNumChanged:(NSString *)str;

@end

@interface CYStepper : UIView

@property (nonatomic,strong) UIButton *addBtn;
@property (nonatomic,strong) UIButton *decBtn;
@property (nonatomic,strong) UILabel *resultLb;
@property (nonatomic, copy) void(^buttonClickBlock)(int currentNum);

- (instancetype)initWithFrame:(CGRect)frame With:(int)Max And:(int)Min;

@property (nonatomic,assign)id <NumChangedDelegate> delegate;

@end
