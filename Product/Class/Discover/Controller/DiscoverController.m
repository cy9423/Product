//
//  RecruitViewController.m
//  ProductShop
//
//  Created by cy on 16/4/13.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "DiscoverController.h"
#import "NewsVC.h"
#import "GoodVC.h"
#import "FocusVC.h"
@interface DiscoverController ()
@property(nonatomic, strong)NewsVC *news;//上新
@property(nonatomic, strong)FocusVC *focus;//关注
@property(nonatomic, strong)GoodVC *good;//良品
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
        _discover.tintColor = [UIColor clearColor];
        NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],
                                                 NSForegroundColorAttributeName: [UIColor redColor]};
        [_discover setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];
        NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],
                                                   NSForegroundColorAttributeName: [UIColor whiteColor]};
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
    
    _news = [[NewsVC alloc]init];
    _focus = [[FocusVC alloc]init];
    _good = [[GoodVC alloc]init];
    
    [self.view addSubview:_news.view];
    _temp = _news.view;
}

- (void)choose:(UISegmentedControl *)segment{
    switch (segment.selectedSegmentIndex) {
        case 0:
        {
            [_temp removeFromSuperview];
            _temp = _news.view;
            [self.view addSubview: _temp];
            break;
        }
            
        case 1:
        {
            [_temp removeFromSuperview];
            _temp = _focus.view;
            [self.view addSubview: _temp];
            break;
        }
            
        case 2:
        {
            [_temp removeFromSuperview];
            _temp = _good.view;
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