//
//  RecruitViewController.m
//  ProductShop
//
//  Created by cy on 16/4/13.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "DiscoverController.h"
#import "LaborVC.h"
#import "WorkerVC.h"
@interface DiscoverController ()
@property(nonatomic, strong)LaborVC *labor;//用工
@property(nonatomic, strong)WorkerVC *worker;//散工
@property(nonatomic, retain)UISegmentedControl *discover;
@end

@implementation DiscoverController
static int i = 64;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationController.tabBarItem.title = @"发现";
        
        _discover = [[UISegmentedControl alloc]initWithItems:@[@"用工订单", @"散工接单"]];
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
        
        _labor = [[LaborVC alloc]init];
        _worker = [[WorkerVC alloc]init];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController.navigationBar addSubview:_discover];
    [_labor.view setFrame:CGRectMake(0, i, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [_worker.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_discover removeFromSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_worker.view];
    [self addChildViewController:_worker];
    [self.view addSubview:_labor.view];
    [self addChildViewController:_labor];
}

- (void)choose:(UISegmentedControl *)segment{
    switch (segment.selectedSegmentIndex) {
        case 0:
        {
            [self transitionFromViewController:_worker toViewController:_labor duration:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finish){
            }];
            break;
        }
            
        case 1:
        {
            [self transitionFromViewController:_labor toViewController:_worker duration:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finish){
            }];
            i = 0;
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