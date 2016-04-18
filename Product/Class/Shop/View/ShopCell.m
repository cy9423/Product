//
//  ShopCell.m
//  Product
//
//  Created by hanxingdl on 16/4/18.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "ShopCell.h"
#import "CYStepper.h"
@interface ShopCell()

@property(nonatomic, retain)UIImageView *img;//图片
@property(nonatomic, retain)UILabel *desc;//描述
@property(nonatomic, retain)CYStepper *step;//计数器
@end
@implementation ShopCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        _num = 1;
        
        _img = [[UIImageView alloc]init];
        [self.contentView addSubview:_img];
        
        _title = [[UILabel alloc]init];
        _title.font = [UIFont systemFontOfSize:13];
        _title.numberOfLines = 2;
        [self.contentView addSubview:_title];
        
        _desc = [[UILabel alloc]init];
        _desc.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_desc];
        
        _price = [[UILabel alloc]init];
        _price.textColor = [UIColor redColor];
        _price.font =[UIFont systemFontOfSize:15];
        [self.contentView addSubview:_price];
        
        _step = [[CYStepper alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-125, 80, 100, 30) With:10 And:1];
        [self.contentView addSubview:_step];
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _img.backgroundColor = [UIColor lightGrayColor];
    
    _img.frame = CGRectMake(35, 15, 95, 95);
    _title.frame = CGRectMake(140, 15, SCREEN_WIDTH-165, 25);
    [_title sizeToFit];
    _desc.frame = CGRectMake(140, 50, SCREEN_WIDTH-165, 20);
    _price.frame = CGRectMake(140, 80, SCREEN_WIDTH-275, 30);
}

- (void)setMod:(ShopModel *)mod{
    _mod = mod;
    _title.text = @"九阳JYY-50YS27智能电压力锅";
    _desc.text = @"颜色分类：土豪金";
    
    float price_s = arc4random()%100000/100.f;
    _price.text = [NSString stringWithFormat:@"￥%.2f", price_s];
    __weak typeof(self) weakSelf = self;
    _step.buttonClickBlock = ^(int currentNum){
        weakSelf.num = currentNum;
    };
    _height = 125;
}

@end

