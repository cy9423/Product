//
//  GoodCell.m
//  Product
//
//  Created by hanxingdl on 16/6/2.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "GoodCell.h"
#import "GoodModel.h"
@interface GoodCell()
@property(nonatomic, retain)UIView *background;
@property(nonatomic, retain)UIImageView *img;
@end
@implementation GoodCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _height = 300;
        
        _background = [[UIView alloc]init];
        _background.layer.shadowColor = [UIColor blackColor].CGColor;
        _background.layer.shadowOffset = CGSizeMake(2,2);
        _background.layer.shadowOpacity = 0.8;
        _background.layer.shadowRadius = 4;
        [self.contentView addSubview:_background];
        
        _img = [[UIImageView alloc]init];
        [_background addSubview:_img];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _background.backgroundColor = [UIColor whiteColor];
    _img.backgroundColor = [UIColor lightGrayColor];
    
    _background.frame = CGRectMake(12, 10, SCREEN_WIDTH-25, 280);
    _img.frame = _background.bounds;
}

- (void)setMod:(GoodModel *)mod{
    _mod = mod;
#warning 判断条件@""看后台
    if ([_mod.pic isEqualToString:@""]) {
        [_img setImage:[UIImage imageNamed:@"sinostar.jpg"]];
    }else{
        [_img setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_mod.pic]]]];
    }
}

@end