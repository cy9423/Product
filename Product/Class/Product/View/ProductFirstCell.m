//
//  ProductFirstCell.m
//  Product
//
//  Created by cy on 16/4/14.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "ProductFirstCell.h"
#import "CYStepper.h"
@implementation ProductFirstCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    CYStepper *ss = [[CYStepper alloc] initWithFrame:CGRectMake(0, 0, 200, 40) With:99 And:0];
    [self.testView addSubview:ss];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
