//
//  ForgetPwdPhoneView.m
//  Greece
//
//  Created by vzai on 2017/12/27.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "ForgetPwdPhoneView.h"

@interface ForgetPwdPhoneView ()
//调用接口的时候要用数据 所以放到h文件
@property (nonatomic, strong) UILabel *sendLabel;
@end

@implementation ForgetPwdPhoneView

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
//        已绑手机
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.font = [UIFont fontWithName:@"MicrosoftYaHei" size:15];
//        titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:titleLabel];
        titleLabel.text = title;
//        0086
        UILabel *codeLabel  = [[UILabel alloc] init];
        codeLabel.text = @"0086";
        codeLabel.font = [UIFont systemFontOfSize:10];
        codeLabel.textColor = [UIColor blackColor];
        codeLabel.layer.cornerRadius = 2;
        codeLabel.layer.masksToBounds = YES;
        codeLabel.layer.borderWidth = 1;
        codeLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
        codeLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:codeLabel];
//        请输入绑定的手机号
        UITextField *textField = [[UITextField alloc] init];
        textField.textColor = [UIColor blackColor];
//        textField.font = [UIFont systemFontOfSize:15];
        titleLabel.font = [UIFont fontWithName:@"MicrosoftYaHei" size:14];
        textField.placeholder = @"请输入绑定的手机号";
        [self addSubview:textField];
        self.textFiled = textField;
//        发送
        UILabel *sendLabel = [[UILabel alloc] init];
        sendLabel.text = @"发送";
        sendLabel.textColor = [UIColor blackColor];
        sendLabel.backgroundColor = [UIColor yellowColor];
        sendLabel.layer.cornerRadius = 5;
        sendLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:sendLabel];
        self.sendLabel = sendLabel;
        
//        发送点击按钮 UI太小 不容易点击到 所以加一个透明的control 接收点击事件
        UIControl *tapSendControl = [[UIControl alloc] init];
        [tapSendControl addTarget:self action:@selector(tapSendAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:tapSendControl];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@12);
            make.top.equalTo(@15);
        }];
        
        [codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(35, 14));
            make.left.equalTo(titleLabel.mas_right).offset(16);
            make.centerY.equalTo(@[titleLabel, sendLabel]);
        }];
        
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@150);
            make.top.bottom.equalTo(self);
//            根据sendLabel来计算文本框的frame
            make.right.equalTo(sendLabel.mas_left).offset(-10);
        }];
        
        [sendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 20));
            make.right.equalTo(self).offset(-10);
            
        }];
        
        [tapSendControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.width.equalTo(sendLabel);
            make.top.bottom.equalTo(self);
        }];
        
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(titleLabel).offset(15);
        }];
    }
    
    return self;
}

- (void)tapSendAction:(UIControl *)control {
    
}

@end
