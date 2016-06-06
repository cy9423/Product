//
//  ProductClassifyOtherCell.m
//  Product
//
//  Created by cy on 16/6/5.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "ProductClassifyOtherCell.h"

@implementation ProductClassifyOtherCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)updateBtnWith:(NSArray *)arr
{
    _l1.text = arr[0];
    [_btn1 setTitle:arr[1] forState:UIControlStateNormal];
    [_btn2 setTitle:arr[2] forState:UIControlStateNormal];
    [_btn3 setTitle:arr[3] forState:UIControlStateNormal];
}
@end
