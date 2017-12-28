//
//  ForgetPwdNormalView.h
//  Greece
//
//  Created by vzai on 2017/12/27.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "XLBaseView.h"

@interface ForgetPwdNormalView : XLBaseView

@property (nonatomic, strong) UITextField *textFiled;

- (instancetype)initWithTitle:(NSString *)title placeholder:(NSString *)placeholder;
@end
