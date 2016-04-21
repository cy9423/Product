//
//  CYStepper.h
//  Product
//
//  Created by cy on 16/4/18.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NumChangedDelegate <NSObject>
- (void)reserveNumChanged:(int)num;
@end

@interface CYStepper : UIView

@property (nonatomic,strong) UIButton *addBtn;
@property (nonatomic,strong) UIButton *decBtn;
@property (nonatomic,strong) UILabel *resultLb;
@property (nonatomic,assign)id <NumChangedDelegate> delegate;
- (instancetype)initWithFrame:(CGRect)frame With:(int)Max And:(int)Min;
@end
