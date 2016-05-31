//
//  AddLaborVC.m
//  Product
//
//  Created by hanxingdl on 16/4/18.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "AddLaborVC.h"
#import "LaborCellModel.h"
@interface AddLaborVC ()<UITextViewDelegate, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet UIDatePicker *date;
@property (strong, nonatomic) IBOutlet UITextField *labTitle;
@property (strong, nonatomic) IBOutlet UITextView *desc;
@property (strong, nonatomic) IBOutlet UITextView *addr;
@property (strong, nonatomic) IBOutlet UITextField *tel;
@property (strong, nonatomic) IBOutlet UITextField *price;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *desc_con;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *addr_con;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *scoll_con;
@property (strong, nonatomic) IBOutlet UIPickerView *way;
@property (strong, nonatomic) IBOutlet UIButton *submit;
@property (strong, nonatomic) NSArray *pickerList;
@property (nonatomic, retain)LaborCellModel *mod;
@end

@implementation AddLaborVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _mod = [[LaborCellModel alloc]init];
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
    
    //下单方式
    _pickerList = [[NSArray alloc]initWithObjects:@"等待散工接单", @"系统自动匹配", @"指定散工下单", nil];
    _way.showsSelectionIndicator=YES;
    _way.dataSource = self;
    _way.delegate = self;
    
    //提交按钮
    _submit.layer.masksToBounds = YES;
    _submit.layer.cornerRadius = 25;
    _submit.layer.borderWidth = 1;
    _submit.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [_submit addTarget:self action:@selector(submit:) forControlEvents:UIControlEventTouchUpInside];
    
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
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];//释放第一响应
    return YES;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _pickerList.count;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {// 返回选中的行

}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {//将数组中数值添加到滚动的那个显示栏上
    return [_pickerList objectAtIndex:row];
}

- (void)keyboardWasShown:(NSNotification*)aNotification {
    //键盘高度
    CGRect keyBoardFrame = [[[aNotification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    _scoll_con.constant = keyBoardFrame.size.height;
}
-(void)keyboardWillBeHidden:(NSNotification*)aNotification {
    _scoll_con.constant = 0;
}

- (void)submit:(UIButton *)btn {//提交
    _mod.labTitle = _labTitle.text;
    _mod.date = @"时间：2016-4-11至2016-4-18";
    _mod.price = _price.text.floatValue;
    _mod.addr = _addr.text;
    _mod.desc = _desc.text;
#warning //错误
    _mod.tel = _tel.text.intValue;
    _mod.way = 0;
    if (self.submitBlock != nil) {
        _submitBlock(_mod);
    }
    [self.navigationController popViewControllerAnimated:YES];
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