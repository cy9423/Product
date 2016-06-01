//
//  MeModel.h
//  Product
//
//  Created by hanxingdl on 16/5/30.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeModel : NSObject
@property(nonatomic, strong)NSString *name;//用户名
@property(nonatomic, strong)NSString *password;//密码
@property(nonatomic ,strong)NSString *login;//头像
@property(nonatomic ,strong)NSString *sex;//性别
@property(nonatomic ,strong)NSString *nickname;//昵称
@property(nonatomic ,strong)NSString *addr;//收货地址
@property(nonatomic ,strong)NSDate *birth;//出生日期
+ (MeModel *)userInfo;//单例
+ (void)synchro;//同步,将单例中的用户名密码保存到userdefault
@end
