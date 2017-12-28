//
//  XLLoginVC.m
//  Greece
//
//  Created by vzai on 2017/12/26.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "XLLoginVC.h"
#import "XLDefine.h"
#import "XLForgetPwdVC.h"
#import "XLRegisterVC.h"
@interface XLLoginVC ()
@property (nonatomic, strong) UITextField *accountTF;
@property (nonatomic, strong) UITextField *passTF;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *forgotBtn;
@property (nonatomic, strong) UIButton *registerBtn;
@property (nonatomic, strong) UILabel *otherLoginLabel;
@property (nonatomic, strong) UIButton *weixinLoginBtn;
@property (nonatomic, strong) UIButton *qqLoginBtn;
@end

@implementation XLLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
    // Do any additional setup after loading the view.
}

- (void)setupViews {
    UIView *bgView1 = [[UIView alloc] init];
    bgView1.backgroundColor = [UIColor whiteColor];
    bgView1.layer.cornerRadius = 3;
    bgView1.layer.masksToBounds = YES;
    [self.view addSubview:bgView1];
    
    self.accountTF = [[UITextField alloc] init];
    self.accountTF.placeholder = @"用户名/手机号";
    self.accountTF.font = [UIFont fontWithName:@"MicrosoftYaHei" size:15];
    self.accountTF.backgroundColor = [UIColor whiteColor];
    self.accountTF.leftViewMode = UITextFieldViewModeAlways;
    [bgView1 addSubview:self.accountTF];
    
    UIView *bgView2 = [[UIView alloc] init];
    bgView2.backgroundColor = [UIColor whiteColor];
    bgView2.layer.cornerRadius = 3;
    bgView2.layer.masksToBounds = YES;
    [self.view addSubview:bgView2];
    
    self.passTF = [[UITextField alloc] init];
    self.passTF.placeholder = @"密码";
    self.passTF.font = [UIFont fontWithName:@"MicrosoftYaHei" size:15];
    self.passTF.backgroundColor = [UIColor whiteColor];
    [bgView2 addSubview:self.passTF];
    
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.backgroundColor = XLBtnOrangeColor;
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.loginBtn];
    
    self.forgotBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.forgotBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    self.forgotBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.forgotBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.forgotBtn addTarget:self action:@selector(forgotPassword:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.forgotBtn];
    
    self.registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.registerBtn setTitle:@"手机注册" forState:UIControlStateNormal];
    self.registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
     [self.registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.registerBtn addTarget:self action:@selector(registerAccount:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.registerBtn];
    
    self.otherLoginLabel = [[UILabel alloc] init];
    self.otherLoginLabel.text = @"第三方账号直接登录";
    self.otherLoginLabel.textAlignment = NSTextAlignmentCenter;
    self.otherLoginLabel.font = [UIFont fontWithName:@"AdobeHeitiStd-Regular" size:10];
    self.otherLoginLabel.textColor = [UIColor colorWithRed:153.0 / 255.0 green:153.0 / 255.0 blue:153.0 / 255.0 alpha:1];
    [self.view addSubview:self.otherLoginLabel];
    
    self.weixinLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.weixinLoginBtn.backgroundColor = [UIColor blueColor];
    [self.weixinLoginBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self.view addSubview:self.weixinLoginBtn];
    
    self.qqLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.qqLoginBtn.backgroundColor = [UIColor blueColor];
    [self.qqLoginBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self.view addSubview:self.qqLoginBtn];
    
    [bgView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(150);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(325, 48));
    }];
    
    [self.accountTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView1);
        make.left.equalTo(bgView1).offset(16);
        make.right.equalTo(bgView1);
    }];
    
    [bgView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(bgView1);
        make.top.equalTo(bgView1.mas_bottom).offset(32);
    }];
    
    
    [self.passTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView2);
        make.left.equalTo(bgView2).offset(16);
        make.right.equalTo(bgView2);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView2.mas_bottom).offset(56);
        make.centerX.equalTo(bgView2);
        make.size.mas_equalTo(CGSizeMake(335, 44));
    }];
    
    [self.forgotBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginBtn.mas_bottom).offset(16);
        make.left.equalTo(self.loginBtn);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginBtn.mas_bottom).offset(16);
        make.right.equalTo(self.loginBtn);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    
    [self.weixinLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-44);
        make.right.equalTo(self.view).offset(-145);
        make.left.equalTo(self.qqLoginBtn.mas_right).offset(25);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [self.qqLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-44);
        make.left.equalTo(self.view).offset(145);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [self.otherLoginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.qqLoginBtn.mas_top).offset(-16);
        make.left.equalTo(self.view.mas_left).offset(100);
        make.right.equalTo(self.view.mas_right).offset(-100);
    }];
}

- (void)forgotPassword:(UIButton *)button {
    [self.navigationController pushViewController:[[XLForgetPwdVC alloc] init] animated:YES];
}

- (void)registerAccount:(UIButton *)button {
    [self.navigationController pushViewController:[[XLRegisterVC alloc] init] animated:YES];
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
