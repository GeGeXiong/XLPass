//
//  ForgetPwdNormalView.m
//  Greece
//
//  Created by vzai on 2017/12/27.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "ForgetPwdNormalView.h"

@implementation ForgetPwdNormalView

- (instancetype)initWithTitle:(NSString *)title placeholder:(NSString *)placeholder {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
//      左边的label
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.font = [UIFont fontWithName:@"MicrosoftYaHei" size:15];
        [self addSubview:titleLabel];
        titleLabel.text = title;
        
        UITextField *textFiled = [[UITextField alloc] init];
        titleLabel.font = [UIFont fontWithName:@"MicrosoftYaHei" size:15];
//        textFiled.font = [UIFont systemFontOfSize:15];
        textFiled.textColor = [UIColor blackColor];
        textFiled.placeholder = placeholder;
        [self addSubview:textFiled];
        self.textFiled = textFiled;
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = XLAllViewControllerBackgroundColor;
        [self addSubview:lineView];
        
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.right.equalTo(self);
            make.height.equalTo(@1);
        }];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@12);
            make.top.equalTo(@15);
            
        }];
        
        [textFiled mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@150);
            make.top.bottom.equalTo(self);
            make.right.equalTo(self);
        }];
        
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(titleLabel).offset(15);
        }];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
