//
//  WorkerCell.h
//  Product
//
//  Created by hanxingdl on 16/4/15.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WorkerCellModel;
@interface WorkerCell : UITableViewCell
@property(nonatomic, retain)WorkerCellModel *mod;
@property(nonatomic, assign)NSInteger height;
@end
