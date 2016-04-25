//
//  AddLaborVC.h
//  Product
//
//  Created by hanxingdl on 16/4/18.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LaborCellModel;
@interface AddLaborVC : UIViewController
@property (nonatomic, copy) void(^submitBlock)(LaborCellModel *mod);
@end
