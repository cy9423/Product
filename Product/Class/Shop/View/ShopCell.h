//
//  ShopCell.h
//  Product
//
//  Created by hanxingdl on 16/4/18.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShopModel;
@interface ShopCell : UITableViewCell
@property(nonatomic, retain)ShopModel *mod;
@property(nonatomic, assign)NSInteger height;
@property(nonatomic, retain)UILabel *title;//标题
@property(nonatomic, retain)UILabel *price;//单价
@property(nonatomic, assign)int num;//数量
@end
