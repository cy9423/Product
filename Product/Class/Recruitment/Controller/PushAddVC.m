//
//  PushAddVC.m
//  Product
//
//  Created by hanxingdl on 16/4/14.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "PushAddVC.h"
@interface PushAddVC()<UITextViewDelegate, UITextFieldDelegate>
@property(nonatomic, retain)UITextField *desc_title;//描述
@property(nonatomic, retain)UIDatePicker *date_finish;//时间
@property(nonatomic, retain)UITextView *addr;//地点
@property(nonatomic, retain)UITextField *way;//方式
@property(nonatomic, retain)UITextView *desc;//详细描述
@property(nonatomic, retain)UITextField *tel;//联系方式
@property(nonatomic, retain)UITextField *pay;//金额
@property(nonatomic, retain)UIButton *submit;//提交并支付
@end
@implementation PushAddVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    //时间
    UILabel *da = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 150, 80)];
    da.text = @"任务截止时间: ";
    da.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:da];
    NSLocale *locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    NSDate *localDate = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [[NSDateComponents alloc]init];
    [comp setYear:1];
    NSDate *maxDate = [gregorian dateByAddingComponents:comp toDate:localDate options:0];
    _date_finish = [[UIDatePicker alloc]initWithFrame:CGRectMake(150, 100, 250, 80)];
    _date_finish.datePickerMode = UIDatePickerModeDate;
    _date_finish.locale = locale;
    _date_finish.minimumDate = localDate;
    _date_finish.maximumDate = maxDate;
    //    [_date_start addTarget:self action:@selector(change:) forControlEvents:(UIControlEventValueChanged)];
    [self.view addSubview:_date_finish];
    
    //地点
    UILabel *ad = [[UILabel alloc]initWithFrame:CGRectMake(0, 200, 150, 20)];
    ad.text = @"交货地点: ";
    ad.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:ad];
    _addr = [[UITextView alloc]initWithFrame:CGRectMake(150, 200, 200, 50)];
    _addr.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _addr.keyboardType = UIKeyboardTypeDefault;
    _addr.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _addr.delegate = self;
    _addr.font = [UIFont systemFontOfSize:15];
    _addr.text = @"傅家庄国际村312";
    [self.view addSubview:_addr];
    
    //描述
    UILabel *de = [[UILabel alloc]initWithFrame:CGRectMake(0, 275, 150, 20)];
    de.text = @"详细描述: ";
    de.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:de];
    _desc = [[UITextView alloc]initWithFrame:CGRectMake(150, 275, 200, 50)];
    _desc.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _desc.keyboardType = UIKeyboardTypeDefault;
    _desc.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _desc.delegate = self;
    _desc.font = [UIFont systemFontOfSize:15];
    _desc.text = @"请详细描述一下任务的具体内容";
    [self.view addSubview:_desc];
    
    //联系方式
    UILabel *te = [[UILabel alloc]initWithFrame:CGRectMake(0, 350, 150, 20)];
    te.text = @"联系方式: ";
    te.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:te];
    _tel = [[UITextField alloc]initWithFrame:CGRectMake(150, 350, 200, 20)];
    _tel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _tel.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    _tel.delegate = self;
    _tel.borderStyle = UITextBorderStyleRoundedRect;
    _tel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_tel];
    
    //金额
    UILabel *pa = [[UILabel alloc]initWithFrame:CGRectMake(0, 395, 150, 20)];
    pa.text = @"总金额: ";
    pa.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:pa];
    _pay = [[UITextField alloc]initWithFrame:CGRectMake(150, 395, 200, 20)];
    _pay.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _pay.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    _pay.delegate = self;
    _pay.borderStyle = UITextBorderStyleRoundedRect;
    _pay.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_pay];
    //提交并支付
    
    //    //添加约束
    //    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[_date_finish]-20-[_addr]-25-[_desc]-25-[_tel]-25-[_pay]|" options:NSLayoutFormatDirectionMask metrics:nil views:NSDictionaryOfVariableBindings(_date_finish, _addr, _desc, _tel, _pay)]];
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {//限定输入范围
    if (textView.contentSize.height>50) {
        CGRect frame = CGRectMake(textView.frame.origin.x,
                                  textView.frame.origin.y,
                                  textView.frame.size.width,
                                  textView.contentSize.height);
        [textView setFrame:frame];
    }
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];//释放第一响应
    return YES;
}

@end
