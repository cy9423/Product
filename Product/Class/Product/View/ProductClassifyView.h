//
//  ProductClassifyView.h
//  Product
//
//  Created by cy on 16/6/5.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductClassifyView : UIView

@property (nonatomic,strong)UITableView *tv;

- (instancetype)initWithFrame:(CGRect)frame With:(NSArray *)arr;

@end
