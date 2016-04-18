//
//  ProductInfoSecondCell.m
//  Product
//
//  Created by cy on 16/4/18.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "ProductInfoSecondCell.h"
#import "CYStepper.h"

@interface ProductInfoSecondCell()<NumChangedDelegate>
{
    CYStepper *stepper;
}
@end

@implementation ProductInfoSecondCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    stepper = [[CYStepper alloc] initWithFrame:CGRectMake(0, 0, 100, 40) With:99 And:1];
    stepper.delegate = self;
    [self.customView addSubview:stepper];
    
}

- (void)reserveNumChanged:(NSString *)str
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
