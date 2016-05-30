//
//  RecruitViewController.m
//  ProductShop
//
//  Created by cy on 16/4/13.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "DiscoverController.h"
#import "LaborVC.h"
@interface DiscoverController ()
@property(nonatomic, strong)LaborVC *labor1;//上新
@property(nonatomic, strong)LaborVC *labor2;//关注
@property(nonatomic, strong)LaborVC *labor3;//良品
@property(nonatomic, strong)UIView *temp;
@property(nonatomic, retain)UISegmentedControl *discover;
@end

@implementation DiscoverController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _discover = [[UISegmentedControl alloc]initWithItems:@[@"上新", @"关注", @"良品"]];
        _discover.frame = CGRectMake(SCREEN_WIDTH/2-100, 0, 200, 40);
        _discover.selectedSegmentIndex = 0;
        [_discover addTarget:self action:@selector(choose:) forControlEvents:UIControlEventValueChanged];
        _discover.tintColor = [UIColor greenColor];
        _discover.layer.masksToBounds = YES;
        _discover.layer.cornerRadius = 20;
        _discover.layer.borderWidth = 1;
        _discover.layer.borderColor = TabBarBackGroundColor.CGColor;
        NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],
                                                 NSForegroundColorAttributeName: [UIColor whiteColor]};
        [_discover setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];
        NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],
                                                   NSForegroundColorAttributeName: [UIColor lightTextColor]};
        [_discover setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar addSubview:_discover];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_discover removeFromSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _labor1 = [[LaborVC alloc]init];
    _labor2 = [[LaborVC alloc]init];
    _labor3 = [[LaborVC alloc]init];
    
    [self.view addSubview:_labor1.view];
    _temp = _labor1.view;
}

- (void)choose:(UISegmentedControl *)segment{
    switch (segment.selectedSegmentIndex) {
        case 0:
        {
            [_temp removeFromSuperview];
            _temp = _labor1.view;
            [self.view addSubview: _temp];
            break;
        }
            
        case 1:
        {
            [_temp removeFromSuperview];
            _temp = _labor2.view;
            [self.view addSubview: _temp];
            break;
        }
            
        case 2:
        {
            [_temp removeFromSuperview];
            _temp = _labor3.view;
            [self.view addSubview: _temp];
            break;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */