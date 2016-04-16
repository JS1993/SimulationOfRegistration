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
        _scrollView.contentSize=CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height+20);
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
    [self creatContent];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardDidChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

-(void)keyboardDidChangeFrame:(NSNotification*)noti{
    self.scrollView.contentOffset=CGPointMake(0, self.scrollView.contentOffset.y+25);
}
-(void)creatContent{
    UILabel* nameL=[[UILabel alloc]initWithFrame:CGRectMake(10, 20, 60, 30)];
    nameL.text=@"用户名";
    [self.scrollView addSubview:nameL];
    UITextField* nameTF=[[UITextField alloc]initWithFrame:CGRectMake(80, 20, 150, 30)];
    nameTF.borderStyle=UITextBorderStyleRoundedRect;
    [self.scrollView addSubview:nameTF];
    UILabel* phoneL=[[UILabel alloc]initWithFrame:CGRectMake(10, 90, 60, 30)];
    phoneL.text=@"手机";
    [self.scrollView addSubview:phoneL];
    UITextField* phoneTF=[[UITextField alloc]initWithFrame:CGRectMake(80, 90, 150, 30)];
    phoneTF.keyboardType=UIKeyboardTypeNumberPad;
    phoneTF.borderStyle=UITextBorderStyleRoundedRect;
    [self.scrollView addSubview:phoneTF];
    UILabel* emailL=[[UILabel alloc]initWithFrame:CGRectMake(10, 160, 60, 30)];
    emailL.text=@"邮箱";
    [self.scrollView addSubview:emailL];
    UITextField* emailTF=[[UITextField alloc]initWithFrame:CGRectMake(80, 160, 150, 30)];
    emailTF.borderStyle=UITextBorderStyleRoundedRect;
    emailTF.keyboardType=UIKeyboardTypeEmailAddress;
    [self.scrollView addSubview:emailTF];
    
    UILabel* birthL=[[UILabel alloc]initWithFrame:CGRectMake(10, 230, 60, 30)];
    birthL.text=@"生日";
    [self.scrollView addSubview:birthL];
    self.birthTF=[[UITextField alloc]initWithFrame:CGRectMake(80, 230, 150, 30)];
    _birthTF.borderStyle=UITextBorderStyleRoundedRect;
    _birthTF.inputView=self.dataPicker;
    _birthTF.inputAccessoryView=self.textFieldToolbar;
    [self.scrollView addSubview:_birthTF];
    
    UILabel* ageL=[[UILabel alloc]initWithFrame:CGRectMake(10, 300, 60, 30)];
    ageL.text=@"年龄";
    [self.scrollView addSubview:ageL];
    UITextField* ageTF=[[UITextField alloc]initWithFrame:CGRectMake(80, 300, 150, 30)];
    ageTF.borderStyle=UITextBorderStyleRoundedRect;
    ageTF.keyboardType=UIKeyboardTypeNumberPad;
    [self.scrollView addSubview:ageTF];
    
    UILabel* userNmaeL=[[UILabel alloc]initWithFrame:CGRectMake(10, 370, 60, 30)];
    userNmaeL.text=@"用户名";
    [self.scrollView addSubview:userNmaeL];
    UITextField* userNmaeTF=[[UITextField alloc]initWithFrame:CGRectMake(80, 370, 150, 30)];
    userNmaeTF.borderStyle=UITextBorderStyleRoundedRect;
    userNmaeTF.keyboardType=UIKeyboardTypeDefault;
    [self.scrollView addSubview:userNmaeTF];
    
    UILabel* userKeyL=[[UILabel alloc]initWithFrame:CGRectMake(10, 440, 60, 30)];
    userKeyL.text=@"密码";
    [self.scrollView addSubview:userKeyL];
    UITextField* userKeyTF=[[UITextField alloc]initWithFrame:CGRectMake(80, 440, 150, 30)];
    userKeyTF.borderStyle=UITextBorderStyleRoundedRect;
    userKeyTF.keyboardType=UIKeyboardTypeDefault;
    [self.scrollView addSubview:userKeyTF];
}

-(void)finishChoose{
    NSDate* date=self.dataPicker.date;
    NSDateFormatter* formatter=[[NSDateFormatter alloc]init];
    formatter.dateFormat=@"yyyy-MM-dd";
    self.birthTF.text=[formatter stringFromDate:date];
}

@end
