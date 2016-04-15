//
//  ProductCategoryCell.h
//  Product
//
//  Created by cy on 16/4/15.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductCategoryCell : UITableViewCell

@property (nonatomic, strong)  UIScrollView *btnScrollView;

@property (nonatomic, strong) UICollectionView *selectCollectionView;

@property (nonatomic,strong) UICollectionViewFlowLayout * fl;

- (void)updateCellWith:(NSArray *)arr;

@end
