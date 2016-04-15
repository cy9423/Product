//
//  RecruitViewController.m
//  ProductShop
//
//  Created by cy on 16/4/13.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "RecruitViewController.h"
#import "LaborVC.h"
#import "WorkerVC.h"
@interface RecruitViewController ()
@property(nonatomic, retain)LaborVC *labor;//用工
@property(nonatomic, retain)WorkerVC *worker;//散工
@property(nonatomic, retain)UISegmentedControl *recruit;
@end

@implementation RecruitViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationController.tabBarItem.title = @"用工";
        
        _recruit = [[UISegmentedControl alloc]initWithItems:@[@"用工订单", @"散工接单"]];
        _recruit.frame = CGRectMake(SCREEN_WIDTH/2-100, 0, 200, 40);
        _recruit.selectedSegmentIndex = 0;
        [_recruit addTarget:self action:@selector(choose:) forControlEvents:UIControlEventValueChanged];
        _recruit.tintColor = [UIColor greenColor];
        _recruit.layer.masksToBounds = YES;
        _recruit.layer.cornerRadius = 20;
        _recruit.layer.borderWidth = 3;
        _recruit.layer.borderColor = TabBarBackGroundColor.CGColor;
        NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],
                                                 NSForegroundColorAttributeName: [UIColor whiteColor]};
        [_recruit setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];
        NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],
                                                   NSForegroundColorAttributeName: [UIColor lightTextColor]};
        [_recruit setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar addSubview:_recruit];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_recruit removeFromSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _labor = [[LaborVC alloc]init];
    [_labor.view setFrame:[UIScreen mainScreen].bounds];
    _worker = [[WorkerVC alloc]init];
    [_worker.view setFrame:[UIScreen mainScreen].bounds];
    
    [self.view addSubview:_labor.view];
    [self addChildViewController:_labor];
}

- (void)choose:(UISegmentedControl *)segment{
    switch (segment.selectedSegmentIndex) {
        case 0:
        {
            [self addChildViewController:_labor];
            [self transitionFromViewController:_worker toViewController:_labor duration:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finish){
                [_worker removeFromParentViewController];
            }];
            break;
        }
            
        case 1:
        {
            [self addChildViewController:_worker];
            [self transitionFromViewController:_labor toViewController:_worker duration:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finish){
                [_labor removeFromParentViewController];
            }];
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

