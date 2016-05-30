//
//  LaborCell.m
//  Product
//
//  Created by hanxingdl on 16/4/15.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "LaborCell.h"
#import "LaborCellModel.h"
@interface LaborCell()//没有联系方式和详细描述
@property(nonatomic, retain)UIView *background;
@property(nonatomic, retain)UIImageView *img;//头像
@property(nonatomic, retain)UILabel *title;//描述
@property(nonatomic, retain)UILabel *date;//时间
@property(nonatomic, retain)UILabel *pay;//金额
@property(nonatomic, retain)UILabel *addr;//地点
@end
@implementation LaborCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _height = 150;
        
        _background = [[UIView alloc]init];
        _background.layer.shadowColor = [UIColor blackColor].CGColor;
        _background.layer.shadowOffset = CGSizeMake(2,2);
        _background.layer.shadowOpacity = 0.8;
        _background.layer.shadowRadius = 4;
        _background.layer.cornerRadius = 10;
        [self.contentView addSubview:_background];
        
        _img = [[UIImageView alloc]init];
        _img.layer.masksToBounds = YES;
        _img.layer.cornerRadius = 10;
        [_background addSubview:_img];
        
        _title = [[UILabel alloc]init];
        _title.numberOfLines = 2;
        [_background addSubview:_title];
        
        _date = [[UILabel alloc]init];
        _date.textColor = [UIColor lightGrayColor];
        _date.font = [UIFont systemFontOfSize:13];
        [_background addSubview:_date];
        
        _pay = [[UILabel alloc]init];
        _pay.textColor = [UIColor brownColor];
        _pay.font = [UIFont systemFontOfSize:13];
        [_background addSubview:_pay];
        
        _addr = [[UILabel alloc]init];
        _addr.font = [UIFont systemFontOfSize:13];
        _addr.textAlignment = NSTextAlignmentRight;
        [_background addSubview:_addr];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _background.backgroundColor = [UIColor whiteColor];
    _img.backgroundColor = [UIColor lightGrayColor];
    
    _background.frame = CGRectMake(12, 10, SCREEN_WIDTH-25, 130);
    _img.frame = CGRectMake(12, 12, 85, 105);
    _title.frame = CGRectMake(110, 12, SCREEN_WIDTH-145, 40);
    [_title sizeToFit];
    _date.frame = CGRectMake(110, 65, SCREEN_WIDTH-230, 20);
    _pay.frame = CGRectMake(SCREEN_WIDTH-110, 65, 75, 20);
    _addr.frame = CGRectMake(110, 97, SCREEN_WIDTH-145, 20);
}

- (void)setMod:(LaborCellModel *)mod{
    _mod = mod;
    _title.text = mod.labTitle;
    _date.text = mod.date;
    _pay.text = [NSString stringWithFormat:@"￥%.2f", mod.price];
    _addr.text = mod.addr;
    [_img setImage:[UIImage imageNamed:@"sinostar.jpg"]];
}

@end
