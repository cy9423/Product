//
//  ProductInfoFirstCell.h
//  Product
//
//  Created by cy on 16/4/18.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductInfoFirstCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *locationBtn;

@property (nonatomic,copy) void(^block)();

@end
