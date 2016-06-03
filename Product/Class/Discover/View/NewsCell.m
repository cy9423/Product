//
//  NewCell.m
//  Product
//
//  Created by hanxingdl on 16/6/2.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "NewsCell.h"
#import "NewsModel.h"
@interface NewsCell()
@property(nonatomic, retain)UIView *background;
@property(nonatomic, retain)UIImageView *img;
@end
@implementation NewsCell
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
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _background.backgroundColor = [UIColor whiteColor];
    _img.backgroundColor = [UIColor lightGrayColor];
    
    _background.frame = CGRectMake(12, 10, SCREEN_WIDTH-25, 130);
    _img.frame = CGRectMake(12, 12, 85, 105);
}

- (void)setMod:(NewsModel *)mod{
    _mod = mod;
    [_img setImage:[UIImage imageNamed:@"sinostar.jpg"]];
}

@end
