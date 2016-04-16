//
//  ViewController.m
//  模拟注册页面
//
//  Created by  江苏 on 16/4/16.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate,UITextFieldDelegate>
@property(nonatomic,strong)UIScrollView* scrollView;
@property(nonatomic,strong)UIDatePicker* dataPicker;
@property(nonatomic,strong)UIToolbar* textFieldToolbar;
@property(nonatomic,strong)UITextField* birthTF;
@end

@implementation ViewController

-(UIView *)textFieldToolbar{
if (_textFieldToolbar==nil) {

       _textFieldToolbar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
       _textFieldToolbar.backgroundColor=[UIColor grayColor];
        //设置按钮
        UIBarButtonItem* preBtn=[[UIBarButtonItem alloc]initWithTitle:@"上一个" style:UIBarButtonItemStylePlain target:nil action:nil];
        UIBarButtonItem* nextBtn=[[UIBarButtonItem alloc]initWithTitle:@"下一个" style:UIBarButtonItemStylePlain target:nil action:nil];
        UIBarButtonItem* fixSpaceBtn=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] ;
        UIBarButtonItem* doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finishChoose)];

        _textFieldToolbar.items=@[preBtn,nextBtn,fixSpaceBtn,doneBtn];
    }
    return _textFieldToolbar;
}

-(UIScrollView *)scrollView{
    if (_scrollView==nil) {
        _scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
        _scrollView.backgroundColor=[UIColor grayColor];
        _scrollView.delegate=self;
        _scrollView.contentSize=CGSizeMake(self.view.bounds.size.width, 1000);
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

-(UIDatePicker *)dataPicker{
    if (_dataPicker==nil) {
        _dataPicker=[[UIDatePicker alloc]init];
        _dataPicker.locale=[NSLocale localeWithLocaleIdentifier:@"zh"];
        _dataPicker.datePickerMode=UIDatePickerModeDate;
    }
    return _dataPicker;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel* nameL=[[UILabel alloc]initWithFrame:CGRectMake(10, 20, 40, 30)];
    nameL.text=@"姓名";
    [self.scrollView addSubview:nameL];
    UITextField* nameTF=[[UITextField alloc]initWithFrame:CGRectMake(50, 20, 150, 30)];
    nameTF.borderStyle=UITextBorderStyleRoundedRect;
    [self.scrollView addSubview:nameTF];
    UILabel* phoneL=[[UILabel alloc]initWithFrame:CGRectMake(10, 60, 40, 30)];
    phoneL.text=@"手机";
    [self.scrollView addSubview:phoneL];
    UITextField* phoneTF=[[UITextField alloc]initWithFrame:CGRectMake(50, 60, 150, 30)];
    phoneTF.keyboardType=UIKeyboardTypeNumberPad;
    phoneTF.borderStyle=UITextBorderStyleRoundedRect;
    [self.scrollView addSubview:phoneTF];
    UILabel* emailL=[[UILabel alloc]initWithFrame:CGRectMake(10, 100, 40, 30)];
    emailL.text=@"邮箱";
    [self.scrollView addSubview:emailL];
    UITextField* emailTF=[[UITextField alloc]initWithFrame:CGRectMake(50, 100, 150, 30)];
    emailTF.borderStyle=UITextBorderStyleRoundedRect;
    emailTF.keyboardType=UIKeyboardTypeEmailAddress;
    [self.scrollView addSubview:emailTF];
    
    UILabel* birthL=[[UILabel alloc]initWithFrame:CGRectMake(10, 140, 40, 30)];
    birthL.text=@"生日";
    [self.scrollView addSubview:birthL];
    self.birthTF=[[UITextField alloc]initWithFrame:CGRectMake(50, 140, 150, 30)];
    _birthTF.borderStyle=UITextBorderStyleRoundedRect;
    _birthTF.inputView=self.dataPicker;
    _birthTF.inputAccessoryView=self.textFieldToolbar;
    [self.scrollView addSubview:_birthTF];
}

-(void)finishChoose{
    NSDate* date=self.dataPicker.date;
    NSDateFormatter* formatter=[[NSDateFormatter alloc]init];
    formatter.dateFormat=@"yyyy-MM-dd";
    self.birthTF.text=[formatter stringFromDate:date];
}
@end
