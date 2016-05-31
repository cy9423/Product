//
//  MeModel.m
//  Product
//
//  Created by hanxingdl on 16/5/30.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "MeModel.h"

@implementation MeModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

+ (MeModel *)userInfo{
    static MeModel *userInfo;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userInfo = [[MeModel alloc] init];
        NSUserDefaults *info = [NSUserDefaults standardUserDefaults];
        NSDictionary *dic = [[NSDictionary alloc]initWithDictionary:[info objectForKey:@"BotouTrade"]];
        if (dic.count == 0) {//第一次运行时创建
            dic = [[NSDictionary alloc]initWithObjectsAndKeys:@"",@"name",@"",@"password",nil];
            [info setObject:dic forKey:@"BotouTrade"];
            [info synchronize];//立刻保存
        }
        [userInfo setValuesForKeysWithDictionary:dic];
    });
    return userInfo;
}

+ (void)synchro {
    NSUserDefaults *info = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:[MeModel userInfo].name,@"name",[MeModel userInfo].password,@"password",nil];
    [info setObject:dic forKey:@"BotouTrade"];
    [info synchronize];//立刻保存
}
@end
