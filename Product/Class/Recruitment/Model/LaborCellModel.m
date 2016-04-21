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

+ (id)makeValue{
    LaborCellModel *mod = [[LaborCellModel alloc]init];
    mod.labTitle = [NSString stringWithFormat:@"%c%d区   %c%c%c%c%c%c公司需要散工%d名制造%c%c－%d型电压力锅", (arc4random()%26+65), (arc4random()%15), (arc4random()%26+65), (arc4random()%26+65), (arc4random()%26+65), (arc4random()%26+65), (arc4random()%26+65), (arc4random()%26+65), (arc4random()%10+1), (arc4random()%26+65), (arc4random()%26+97), (arc4random()%900+100)];
    mod.date = @"时间：2016-4-11至2016-4-18";
    mod.price = (arc4random()%99999)+1;
    mod.addr = [NSString stringWithFormat:@"傅家庄国际村%d", (arc4random()%1000)];
    mod.desc = @"这里是详细描述";
    mod.tel = 13000000000 + arc4random()%1000000000;
    mod.way = 0;
    return mod;
}
@end
