//
//  laborCellModel.m
//  Product
//
//  Created by hanxingdl on 16/4/15.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "LaborCellModel.h"

@implementation LaborCellModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

+ (id)modWithDic:(NSDictionary *)dic{
    LaborCellModel *mod = [[LaborCellModel alloc]init];
    [mod setValuesForKeysWithDictionary:dic];
//    [mod setValue:[dic objectForKey:@"description"] forKey:@"desc"];
    return mod;
}
@end
