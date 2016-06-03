//
//  NewCell.h
//  Product
//
//  Created by hanxingdl on 16/6/2.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsModel;
@interface NewsCell : UITableViewCell
@property(nonatomic, retain)NewsModel *mod;
@property(nonatomic, assign)NSInteger height;
@end
