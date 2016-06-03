//
//  NewModel.m
//  Product
//
//  Created by hanxingdl on 16/6/2.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

+ (id)modWithDic:(NSDictionary *)dic{
    NewsModel *mod = [[NewsModel alloc]init];
    [mod setValuesForKeysWithDictionary:dic];
    //    [mod setValue:[dic objectForKey:@"description"] forKey:@"desc"];
    return mod;
}
@end
