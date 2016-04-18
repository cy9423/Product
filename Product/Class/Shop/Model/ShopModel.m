//
//  ShopModel.m
//  Product
//
//  Created by hanxingdl on 16/4/18.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "ShopModel.h"

@implementation ShopModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

+ (id)modWithDic:(NSDictionary *)dic{
    ShopModel *mod = [[ShopModel alloc]init];
    [mod setValuesForKeysWithDictionary:dic];
    return mod;
}
@end
