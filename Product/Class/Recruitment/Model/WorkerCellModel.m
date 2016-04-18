//
//  WorkerCellModel.m
//  Product
//
//  Created by hanxingdl on 16/4/15.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "WorkerCellModel.h"

@implementation WorkerCellModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

+ (id)modWithDic:(NSDictionary *)dic{
    WorkerCellModel *mod = [[WorkerCellModel alloc]init];
    [mod setValuesForKeysWithDictionary:dic];
    //    [mod setValue:[dic objectForKey:@"description"] forKey:@"desc"];
    return mod;
}
@end
