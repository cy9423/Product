//
//  ProductClassifyOtherCell.h
//  Product
//
//  Created by cy on 16/6/5.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductClassifyOtherCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UILabel *l1;

- (void)updateBtnWith:(NSArray *)arr;



@end
