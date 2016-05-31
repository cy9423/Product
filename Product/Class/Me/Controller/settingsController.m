//
//  settingsController.m
//  Product
//
//  Created by hanxingdl on 16/5/31.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "settingsController.h"

@interface settingsController ()<UITextViewDelegate, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *scoll_con;
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *nickName;
@property (strong, nonatomic) IBOutlet UIImageView *img;
@property (strong, nonatomic) IBOutlet UIButton *male;
@property (strong, nonatomic) IBOutlet UIButton *female;
@property (strong, nonatomic) IBOutlet UIDatePicker *date;
@property (strong, nonatomic) IBOutlet UITextView *addr;
@end

@implementation settingsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    _userName.delegate = self;
    _userName.borderStyle = UITextBorderStyleRoundedRect;
    _userName.font = [UIFont systemFontOfSize:15];
    _userName.text = @"asdfg";
    
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
