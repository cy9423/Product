//
//  AddLaborVC.m
//  Product
//
//  Created by hanxingdl on 16/4/18.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "AddLaborVC.h"

@interface AddLaborVC ()<UITextViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIDatePicker *date;
@property (strong, nonatomic) IBOutlet UITextField *labTitle;
@property (strong, nonatomic) IBOutlet UITextView *desc;
@property (strong, nonatomic) IBOutlet UITextView *addr;
@property (strong, nonatomic) IBOutlet UITextField *tel;
@property (strong, nonatomic) IBOutlet UITextField *price;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *desc_con;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *addr_con;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *scoll_con;

@end

@implementation AddLaborVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    //时间
    NSLocale *locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    NSDate *localDate = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [[NSDateComponents alloc]init];
    [comp setYear:1];
    NSDate *maxDate = [gregorian dateByAddingComponents:comp toDate:localDate options:0];
    _date.datePickerMode = UIDatePickerModeDate;
    _date.locale = locale;
    _date.minimumDate = localDate;
    _date.maximumDate = maxDate;
    //    [_date addTarget:self action:@selector(change:) forControlEvents:(UIControlEventValueChanged)];
    
    //标题
    _labTitle.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    _labTitle.delegate = self;
    _labTitle.borderStyle = UITextBorderStyleRoundedRect;
    _labTitle.font = [UIFont systemFontOfSize:15];

    //详细描述
    _desc.keyboardType = UIKeyboardTypeDefault;
    _desc.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _desc.delegate = self;
    _desc.font = [UIFont systemFontOfSize:15];
    _desc.text = @"请详细描述一下任务的具体内容";
    
    //地点
    _addr.keyboardType = UIKeyboardTypeDefault;
    _addr.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _addr.delegate = self;
    _addr.font = [UIFont systemFontOfSize:15];
    _addr.text = @"傅家庄国际村312";
    
    //联系方式
    _tel.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    _tel.delegate = self;
    _tel.borderStyle = UITextBorderStyleRoundedRect;
    _tel.font = [UIFont systemFontOfSize:15];
    
    //金额
    _price.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    _price.delegate = self;
    _price.borderStyle = UITextBorderStyleRoundedRect;
    _price.font = [UIFont systemFontOfSize:15];
    
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

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {//限定输入范围
    if (textView.contentSize.height>50) {
        _desc_con.constant = _desc.contentSize.height;
        _addr_con.constant = _addr.contentSize.height;
    }
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)keyboardWasShown:(NSNotification*)aNotification {
    //键盘高度
    CGRect keyBoardFrame = [[[aNotification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    _scoll_con.constant = keyBoardFrame.size.height;
}

-(void)keyboardWillBeHidden:(NSNotification*)aNotification {
    _scoll_con.constant = 0;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];//释放第一响应
    return YES;
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
