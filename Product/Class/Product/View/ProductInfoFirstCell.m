//
//  ProductInfoFirstCell.m
//  Product
//
//  Created by cy on 16/4/18.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "ProductInfoFirstCell.h"

@implementation ProductInfoFirstCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.locationBtn addTarget:self action:@selector(location) forControlEvents:UIControlEventTouchUpInside];
}

- (void)location
{
    self.block();
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
