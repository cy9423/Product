//
//  MainTabBarController.m
//  ProductShop
//
//  Created by cy on 16/4/12.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self cusomTabBarItem];
}

- (void)cusomTabBarItem
{
    
    self.tabBar.barTintColor = TabBarBackGroundColor;
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];
    NSMutableArray *array = [NSMutableArray array];
    
    NSArray *viewControllersArray = @[@"ProductViewController", @"RecruitViewController", @"ShopViewController", @"MeViewController"];
    
    NSArray *picArr = @[@"home",@"discover",@"shop",@"me"];
    NSArray *selectPicArr = @[@"home_select",@"discover_select",@"shop_select",@"me_select"];
    
    NSArray *titleArr = @[@"商品",@"用工",@"购物车",@"发现"];
    for (int i = 0; i < 4; i++)
    {
        id class = NSClassFromString(viewControllersArray[i]);
        
        UIViewController *vc = [[class alloc] init];
        
        vc.title = titleArr[i];
        vc.tabBarItem.image = [[UIImage imageNamed:picArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectPicArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        vc.tabBarItem.tag = i;
        
        [array addObject:vc];
    }
    //增加新建类中的viewcontrollers
    self.viewControllers = array;
    
    self.delegate = self;

}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    self.title = item.title;
    if ([self.title isEqualToString:@"用工"]) {
        self.title = @"";
    }
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
