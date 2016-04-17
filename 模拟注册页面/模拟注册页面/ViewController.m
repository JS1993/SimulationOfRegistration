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
@property(nonatomic,strong)NSMutableArray* textFields;
@end

@implementation ViewController

-(UIView *)textFieldToolbar{
if (_textFieldToolbar==nil) {

       _textFieldToolbar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
       _textFieldToolbar.backgroundColor=[UIColor grayColor];
        //设置按钮
        UIBarButtonItem* preBtn=[[UIBarButtonItem alloc]initWithTitle:@"上一个" style:UIBarButtonItemStylePlain target:self action:@selector(preTF)];
        UIBarButtonItem* nextBtn=[[UIBarButtonItem alloc]initWithTitle:@"下一个" style:UIBarButtonItemStylePlain target:self action:@selector(nextTF)];
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
        _scrollView.contentSize=CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height);
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
    self.textFields=[NSMutableArray array];
    [self creatContent];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardDidChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

-(void)keyboardDidChangeFrame:(NSNotification*)noti{
    int currentIndex=[self getCurrentIndex];
    UITextField* tf=self.textFields[currentIndex];
    //得到键盘的最大y值
    CGRect fm=[noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyMaxY=fm.origin.y;
    //得到输入框最大Y值
    CGFloat textTFMaxY=tf.frame.origin.y+self.scrollView.frame.origin.y;
    if (textTFMaxY+15>keyMaxY) {
        [UIView animateWithDuration:0.25 animations:^{
            self.view.transform = CGAffineTransformMakeTranslation(0, keyMaxY - textTFMaxY-40);
        }];
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            self.view.transform = CGAffineTransformIdentity;
        }];
    }
    
}
-(void)creatContent{
    UILabel* nameL=[[UILabel alloc]initWithFrame:CGRectMake(10, 20, 60, 30)];
    nameL.text=@"用户名";
    [self.scrollView addSubview:nameL];
    UITextField* nameTF=[[UITextField alloc]initWithFrame:CGRectMake(80, 20, 150, 30)];
    nameTF.borderStyle=UITextBorderStyleRoundedRect;
    nameTF.inputAccessoryView=self.textFieldToolbar;
    [self.scrollView addSubview:nameTF];
    [self.textFields addObject:nameTF];
    UILabel* phoneL=[[UILabel alloc]initWithFrame:CGRectMake(10, 90, 60, 30)];
    phoneL.text=@"手机";
    [self.scrollView addSubview:phoneL];
    UITextField* phoneTF=[[UITextField alloc]initWithFrame:CGRectMake(80, 90, 150, 30)];
    phoneTF.keyboardType=UIKeyboardTypeNumberPad;
    phoneTF.borderStyle=UITextBorderStyleRoundedRect;
    phoneTF.inputAccessoryView=self.textFieldToolbar;
    [self.scrollView addSubview:phoneTF];
    [self.textFields addObject:phoneTF];
    UILabel* emailL=[[UILabel alloc]initWithFrame:CGRectMake(10, 160, 60, 30)];
    emailL.text=@"邮箱";
    [self.scrollView addSubview:emailL];
    UITextField* emailTF=[[UITextField alloc]initWithFrame:CGRectMake(80, 160, 150, 30)];
    emailTF.borderStyle=UITextBorderStyleRoundedRect;
    emailTF.keyboardType=UIKeyboardTypeEmailAddress;
    emailTF.inputAccessoryView=self.textFieldToolbar;
    [self.scrollView addSubview:emailTF];
    [self.textFields addObject:emailTF];
    
    UILabel* birthL=[[UILabel alloc]initWithFrame:CGRectMake(10, 230, 60, 30)];
    birthL.text=@"生日";
    [self.scrollView addSubview:birthL];
    self.birthTF=[[UITextField alloc]initWithFrame:CGRectMake(80, 230, 150, 30)];
    _birthTF.borderStyle=UITextBorderStyleRoundedRect;
    _birthTF.inputView=self.dataPicker;
    _birthTF.inputAccessoryView=self.textFieldToolbar;
    [self.scrollView addSubview:_birthTF];
    [self.textFields addObject:self.birthTF];
    
    UILabel* ageL=[[UILabel alloc]initWithFrame:CGRectMake(10, 300, 60, 30)];
    ageL.text=@"年龄";
    [self.scrollView addSubview:ageL];
    UITextField* ageTF=[[UITextField alloc]initWithFrame:CGRectMake(80, 300, 150, 30)];
    ageTF.borderStyle=UITextBorderStyleRoundedRect;
    ageTF.keyboardType=UIKeyboardTypeNumberPad;
    ageTF.inputAccessoryView=self.textFieldToolbar;
    [self.scrollView addSubview:ageTF];
    [self.textFields addObject:ageTF];
    
    UILabel* userNmaeL=[[UILabel alloc]initWithFrame:CGRectMake(10, 370, 60, 30)];
    userNmaeL.text=@"用户名";
    [self.scrollView addSubview:userNmaeL];
    UITextField* userNmaeTF=[[UITextField alloc]initWithFrame:CGRectMake(80, 370, 150, 30)];
    userNmaeTF.borderStyle=UITextBorderStyleRoundedRect;
    userNmaeTF.keyboardType=UIKeyboardTypeDefault;
    userNmaeTF.inputAccessoryView=self.textFieldToolbar;
    [self.scrollView addSubview:userNmaeTF];
    [self.textFields addObject:userNmaeTF];
    
    UILabel* userKeyL=[[UILabel alloc]initWithFrame:CGRectMake(10, 440, 60, 30)];
    userKeyL.text=@"密码";
    [self.scrollView addSubview:userKeyL];
    UITextField* userKeyTF=[[UITextField alloc]initWithFrame:CGRectMake(80, 440, 150, 30)];
    userKeyTF.borderStyle=UITextBorderStyleRoundedRect;
    userKeyTF.keyboardType=UIKeyboardTypeDefault;
    userKeyTF.inputAccessoryView=self.textFieldToolbar;
    [self.scrollView addSubview:userKeyTF];
    [self.textFields addObject:userKeyTF];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [UIView animateWithDuration:0.25 animations:^{
        self.view.transform = CGAffineTransformIdentity;
    }];
}

-(void)finishChoose{
    int currentIndex=[self getCurrentIndex];
    if (currentIndex==[self.textFields indexOfObject:self.birthTF]) {
        NSDate* date=self.dataPicker.date;
        NSDateFormatter* formatter=[[NSDateFormatter alloc]init];
        formatter.dateFormat=@"yyyy-MM-dd";
        self.birthTF.text=[formatter stringFromDate:date];
        [self.textFields[currentIndex] resignFirstResponder];
        [self touchesBegan:nil withEvent:nil];
    }else {
        [self.textFields[currentIndex] resignFirstResponder];
        [self touchesBegan:nil withEvent:nil];
    }
}

-(void)preTF{
    int currentIndex=[self getCurrentIndex];
    if (currentIndex>0) {
        [self.textFields[currentIndex-1] becomeFirstResponder];
    }
}

-(void)nextTF{
    int currentIndex=[self getCurrentIndex];
    if (currentIndex<self.textFields.count-1) {
        [self.textFields[currentIndex+1] becomeFirstResponder];
    }
}
//得到当前textField在数组中的位置
-(int)getCurrentIndex{
    for (UITextField* TF in self.textFields) {
        if ([TF isFirstResponder]) {
            return (int)[self.textFields indexOfObject:TF];
        }
    }
    //返回-1代表没有找到当前的相应者
    return -1;
}
@end
