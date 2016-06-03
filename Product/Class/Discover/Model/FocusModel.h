//
//  FocusModel.h
//  Product
//
//  Created by hanxingdl on 16/6/2.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FocusModel : NSObject
@property (nonatomic, strong)NSString *pic;//商品图片
+ (id)modWithDic:(NSDictionary *)dic;
@end
