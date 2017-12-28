//
//  XLRegisterVC.m
//  Greece
//
//  Created by vzai on 2017/12/27.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "XLRegisterVC.h"
#import "ForgetPwdPhoneView.h"
#import "ForgetPwdNormalView.h"
@interface XLRegisterVC ()

@end

@implementation XLRegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"注册";

    ForgetPwdNormalView *accountView = [[ForgetPwdNormalView alloc] initWithTitle:@"用户名" placeholder:@"请输入用户名"];
    [self.view addSubview:accountView];
    
    ForgetPwdNormalView *pwdView = [[ForgetPwdNormalView alloc] initWithTitle:@"密码" placeholder:@"请输入密码"];
    [self.view addSubview:pwdView];
    
    UIView *addLineView = [[UIView alloc] init];
    [self.view addSubview:addLineView];
    
    ForgetPwdPhoneView *phoneView = [[ForgetPwdPhoneView alloc] initWithTitle:@"手机号码"];
    [self.view addSubview:phoneView];
    
    ForgetPwdNormalView *codeView = [[ForgetPwdNormalView alloc] initWithTitle:@"验证码" placeholder:@"请输入验证码"];
    [self.view addSubview:codeView];
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    confirmBtn.backgroundColor = XLBtnOrangeColor;
    confirmBtn.layer.cornerRadius = 3;
    confirmBtn.layer.masksToBounds = YES;
    [self.view addSubview:confirmBtn];
    
    [accountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
    }];
    
    [pwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(accountView.mas_bottom);
        
    }];
    
    [addLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(pwdView.mas_bottom);
        make.height.equalTo(@1);
    }];
    
    [phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(addLineView.mas_bottom);
        
    }];
    
    [codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(phoneView.mas_bottom);
    }];
    
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(codeView.mas_bottom).offset(20);
        make.height.equalTo(@44);
    }];
    // Do any additional setup after loading the view.
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
