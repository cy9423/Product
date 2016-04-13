//
//  MainNavigationController.m
//  ProductShop
//
//  Created by cy on 16/4/12.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self cutomNaviItem];
}

- (void)cutomNaviItem
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.navigationBar.barTintColor = NaviBarBackGroundColor;
    self.navigationBar.tintColor = [UIColor whiteColor];
    
    NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    self.navigationBar.titleTextAttributes = dict;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
