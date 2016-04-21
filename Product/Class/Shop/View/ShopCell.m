//
//  ShopCell.m
//  Product
//
//  Created by hanxingdl on 16/4/18.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "ShopCell.h"
#import "CYStepper.h"
@interface ShopCell()<NumChangedDelegate>
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
        _step.delegate = self;
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
    _title.text = [NSString stringWithFormat:@"A.O.Smith/史密斯 %d升 防煤气中毒 宽频恒温燃气热水器%c%c%c%d-%c%d", (arc4random()%99+1), (arc4random()%26+65), (arc4random()%26+65), (arc4random()%26+65), (arc4random()%99+1), (arc4random()%26+65), (arc4random()%8+1)];
    _desc.text = [NSString stringWithFormat:@"颜色分类：土豪金   已售%d件", (arc4random()%999)+1];
    
    float price_s = arc4random()%100000/100.f;
    _price.text = [NSString stringWithFormat:@"￥%.2f", price_s];
    [_img setImage:[UIImage imageNamed:@"smith.jpg"]];
    _height = 125;
}

- (void)reserveNumChanged:(int)num{
    _num = num;
}

@end

