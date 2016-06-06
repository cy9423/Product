//
//  ProductClassifyHeaderView.m
//  Product
//
//  Created by cy on 16/5/30.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "ProductClassifyHeaderView.h"

@interface ProductClassifyHeaderView()

@end

@implementation ProductClassifyHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]){
        NSArray *arr = @[@"配送",@"品牌",@"材质",@"分类"];
        
        float width = frame.size.width;
        float height = frame.size.height;
        
        for (int i = 0; i < arr.count; i++) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20 * (i + 1) + (width - 5 * 20) / 4.0 * i, 5, (width - 5 * 20) / 4.0, height - 10)];
            
            [self addSubview:btn];
            [btn setTitle:arr[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor colorWithRed:241 /255.0 green:242 / 255.0 blue:246 / 255.0 alpha:1]];
            btn.layer.cornerRadius = (height - 10) / 2.0;
        }
        
    }
    return self;
}

@end
