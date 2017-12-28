//
//  ForgetPassViewController.m
//  Greece
//
//  Created by vzai on 2017/12/26.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "XLForgetPwdVC.h"
#import "SCUtils.h"
#import "ForgetPwdPhoneView.h"
#import "ForgetPwdNormalView.h"

@interface XLForgetPwdVC ()

@end

@implementation XLForgetPwdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"忘记密码";
    
    [self initWithPhoneTf];
    // Do any additional setup after loading the view.
}


- (void)initWithPhoneTf {
    ForgetPwdPhoneView *phoneView = [[ForgetPwdPhoneView alloc] initWithTitle:@"已绑手机"];
    [self.view addSubview:phoneView];
    
    ForgetPwdNormalView *codeView = [[ForgetPwdNormalView alloc] initWithTitle:@"验证码" placeholder:@"请输入所接到的验证码"];
    [self.view addSubview:codeView];
    
    ForgetPwdNormalView *pwdView = [[ForgetPwdNormalView alloc] initWithTitle:@"设置新密码" placeholder:@"请输入新密码"];
    [self.view addSubview:pwdView];
    
    ForgetPwdNormalView *rePwdView = [[ForgetPwdNormalView alloc] initWithTitle:@"确认新密码" placeholder:@"请再次输入新密码"];
    [self.view addSubview:rePwdView];
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [confirmBtn setBackgroundColor:[UIColor yellowColor]];
    confirmBtn.layer.cornerRadius = 3;
    [self.view addSubview:confirmBtn];
    
    [phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        
    }];
    
    [codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(phoneView.mas_bottom);
    }];
    
    [pwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(codeView.mas_bottom);
    }];
    
    [rePwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(pwdView.mas_bottom);
    }];
    
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(rePwdView.mas_bottom).offset(20);
        make.height.equalTo(@44);
    }];
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
