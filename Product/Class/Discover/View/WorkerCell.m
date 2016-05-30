//
//  WorkerCell.m
//  Product
//
//  Created by hanxingdl on 16/4/15.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "WorkerCell.h"
@interface WorkerCell()
@property(nonatomic, retain)UIView *background;
@property(nonatomic, retain)UIImageView *img;//头像
@property(nonatomic, retain)UILabel *title;//姓名
@property(nonatomic, retain)UILabel *grade;//评分
@property(nonatomic, retain)UILabel *desc;//介绍
@end
@implementation WorkerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _height = 240;
        
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
        [_background addSubview:_title];
        
        _grade = [[UILabel alloc]init];
        _grade.textColor = [UIColor brownColor];
        [_background addSubview:_grade];
        
        _desc = [[UILabel alloc]init];
        _desc.font = [UIFont systemFontOfSize:13];
        _desc.numberOfLines = 3;
        [_background addSubview:_desc];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _background.backgroundColor = [UIColor whiteColor];
    _img.backgroundColor = [UIColor lightGrayColor];
    
    _background.frame = CGRectMake(12, 10, SCREEN_WIDTH-25, 220);
    _img.frame = CGRectMake(12, 12, 150, 195);
    _title.frame = CGRectMake(175, 12, SCREEN_WIDTH-210, 20);
    _grade.frame = CGRectMake(175, 45, SCREEN_WIDTH-210, 20);
    _desc.frame = CGRectMake(175, 77, SCREEN_WIDTH-210, 40);
    [_desc sizeToFit];
}

- (void)setMod:(WorkerCellModel *)mod{
    _mod = mod;
    _title.text = [NSString stringWithFormat:@"%d", arc4random()%100];
    float grade = arc4random()%100/10.f;
    NSString *string = [[NSString alloc]init];
    for (int i=0; i<5; i++) {
        if (grade - 2*i>0) {
            if (grade - 2*i>1) {
                string = [string stringByAppendingFormat:@"★"];
            }else{
                string = [string stringByAppendingFormat:@"☆"];
            }
        }else{
            string = [string stringByAppendingFormat:@"  "];
        }
    }
    _grade.text = [NSString stringWithFormat:@"%@        评分：%.1f", string, grade];
    _desc.text = @"ahsgdfgawkeubckuwyeugifhnvC MAWYFEGHJFOMNCJAWBRESUGIEHJFMNCBYF,UGIHJEDNABCSE4YUGW3IHJED";
}

@end
