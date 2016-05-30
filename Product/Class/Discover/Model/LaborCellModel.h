//
//  laborCellModel.h
//  Product
//
//  Created by hanxingdl on 16/4/15.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LaborCellModel : NSObject
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *labTitle;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSString *addr;
@property (assign, nonatomic) NSInteger tel;
@property (assign, nonatomic) float price;
@property (assign, nonatomic) NSInteger way;
+ (id)modWithDic:(NSDictionary *)dic;
+ (id)makeValue;
@end
