//
//  LabDetails.m
//  Product
//
//  Created by hanxingdl on 16/4/21.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "LabDetails.h"
#import "LaborCellModel.h"
@interface LabDetails()
@property (strong, nonatomic) IBOutlet UILabel *labTitle;
@property (strong, nonatomic) IBOutlet UIImageView *img;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UILabel *addr;
@property (strong, nonatomic) IBOutlet UILabel *tel;
@property (strong, nonatomic) IBOutlet UILabel *desc;
@property (strong, nonatomic) IBOutlet UIButton *OK;
@property (strong, nonatomic) IBOutlet UIButton *cancel;
@end

@implementation LabDetails
- (void)awakeFromNib{
    _mod = [[LaborCellModel alloc]init];
    [_img setImage:[UIImage imageNamed:@"sinostar.jpg"]];
}

- (IBAction)OK:(UIButton *)sender {
    
}

- (IBAction)cancel:(UIButton *)sender {
    [self removeFromSuperview];
}

- (void)setMod:(LaborCellModel *)mod{
    _mod = mod;
    _labTitle.text = _mod.labTitle;
    _date.text = _mod.date;
    _price.text = [NSString stringWithFormat:@"￥%.2f", _mod.price];
    _addr.text = _mod.addr;
    _tel.text = [NSString stringWithFormat:@"联系电话：%ld", _mod.tel];
    _desc.text = _mod.desc;
}
@end
