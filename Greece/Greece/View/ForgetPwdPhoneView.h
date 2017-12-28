//
//  ForgetPwdPhoneView.h
//  Greece
//
//  Created by vzai on 2017/12/27.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "XLBaseView.h"

@interface ForgetPwdPhoneView : XLBaseView
//调用接口的时候要用数据 所以放到h文件
@property (nonatomic, strong) UITextField *textFiled;

- (instancetype)initWithTitle:(NSString *)title;

@end
