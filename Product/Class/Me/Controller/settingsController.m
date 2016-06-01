//
//  settingsController.m
//  Product
//
//  Created by hanxingdl on 16/5/31.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "settingsController.h"
#import "MeModel.h"
@interface settingsController ()<UITextViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *nickName;
@property (strong, nonatomic) IBOutlet UITextView *addr;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *scoll_con;
@property (strong, nonatomic) IBOutlet UIButton *male;
@property (strong, nonatomic) IBOutlet UIButton *female;
@property (strong, nonatomic) IBOutlet UILabel *sex;//性别
@property (strong, nonatomic) IBOutlet UIDatePicker *date;
@property (strong, nonatomic) IBOutlet UILabel *dateLab;//出生日期
@property (strong, nonatomic) IBOutlet UIButton *img;
@end

@implementation settingsController

static BOOL isEdit = NO;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItem:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItem:)];
    self.view.userInteractionEnabled = NO;
    
    _userName.delegate = self;
    _userName.text = [MeModel userInfo].name;
    _nickName.delegate = self;
    _addr.delegate = self;
    
#warning 根据后台修改
    if (!([[MeModel userInfo].login isEqualToString:@""]||([MeModel userInfo].login == nil))) {
        [_img setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[MeModel userInfo].login]]]forState:UIControlStateNormal];
    }
    if (!([[MeModel userInfo].sex isEqualToString:@""]||([MeModel userInfo].sex == nil))) {
        _sex.text = [MeModel userInfo].sex;
        if ([_sex.text isEqualToString:@"男"]) {
            _male.selected = YES;
        } else if ([_sex.text isEqualToString:@"女"]) {
            _female.selected = YES;
        }
    }
    if (!([[MeModel userInfo].nickname isEqualToString:@""]||([MeModel userInfo].nickname == nil))) {
        _nickName.text = [MeModel userInfo].nickname;
    }
    if (!([[MeModel userInfo].addr isEqualToString:@""]||([MeModel userInfo].addr == nil))) {
        _addr.text = [MeModel userInfo].addr;
    }
    
    NSDate *localDate = [NSDate date];//当前时间
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];//日历
    NSDateComponents *comp = [[NSDateComponents alloc]init];
    [comp setYear:-100];//区间为100年
    NSDate *miniDate = [gregorian dateByAddingComponents:comp toDate:localDate options:0];//100年前的时间
    _date.datePickerMode = UIDatePickerModeDate;
    _date.minimumDate = miniDate;
    _date.maximumDate = localDate;
    _date.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];//中国时区
    if ([MeModel userInfo].birth != nil) {
        _date.date = [MeModel userInfo].birth;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        _dateLab.text = [dateFormatter stringFromDate:_date.date];
    }
    _date.hidden = YES;
    
    //注册键盘出现的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    //注册键盘消失的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

//键盘高度
- (void)keyboardWasShown:(NSNotification*)aNotification {
    CGRect keyBoardFrame = [[[aNotification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    _scoll_con.constant = keyBoardFrame.size.height;
}
-(void)keyboardWillBeHidden:(NSNotification*)aNotification {
    _scoll_con.constant = 0;
}

//释放第一响应
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)sexBtnClick:(UIButton *)sex {//性别
    _male.selected = NO;
    _female.selected = NO;
    sex.selected = YES;
}

- (void)leftBarButtonItem:(UIBarButtonItem *)button {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)rightBarButtonItem:(UIBarButtonItem *)button {
    isEdit = !isEdit;
    if (isEdit) {
        self.navigationItem.leftBarButtonItem.title = @"取消";
        self.navigationItem.rightBarButtonItem.title = @"提交";
        self.view.userInteractionEnabled = YES;
        _userName.backgroundColor = [UIColor whiteColor];
        _nickName.backgroundColor = [UIColor whiteColor];
        if ([_nickName.text isEqualToString:@"未填写"]) {
            _nickName.text = @"";
        }
        _addr.backgroundColor = [UIColor whiteColor];
        if ([_addr.text isEqualToString:@"未填写"]) {
            _addr.text = @"";
        }
        _date.hidden = NO;
        _dateLab.hidden = YES;
        _sex.hidden = YES;
    } else {
        self.navigationItem.leftBarButtonItem.title = @"返回";
        self.navigationItem.rightBarButtonItem.title = @"编辑";
        self.view.userInteractionEnabled = NO;
        
        _userName.backgroundColor = self.view.backgroundColor;
        if ([_userName.text isEqualToString:@""]) {
            _userName.text = [MeModel userInfo].name;
        }
        
        _nickName.backgroundColor = self.view.backgroundColor;
        if ([_nickName.text isEqualToString:@""]) {
            _nickName.text = @"未填写";
        }
        
        _addr.backgroundColor = self.view.backgroundColor;
        if ([_addr.text isEqualToString:@""]) {
            _addr.text = @"未填写";
        }
        
        if ([_male isSelected]) {
            _sex.text = @"男";
        } else if ([_female isSelected]){
            _sex.text = @"女";
        }
        _sex.hidden = NO;
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        _dateLab.text = [dateFormatter stringFromDate:_date.date];
        _dateLab.hidden = NO;
        _date.hidden = YES;
        
        [MeModel userInfo].name = _userName.text;
        [MeModel userInfo].nickname = _nickName.text;
        [MeModel userInfo].addr = _addr.text;
        [MeModel userInfo].sex = _sex.text;
        [MeModel userInfo].birth = [_date date];
#warning 数据提交到后台
    }
    self.view.userInteractionEnabled = isEdit;
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
