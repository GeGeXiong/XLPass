//
//  SCUtils.m
//  BlueSky
//
//  Created by liwenyan on 2017/12/21.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "SCUtils.h"
#import "NSObject+SCAdd.h"
#import "NSString+SCAdd.h"
#import "UIView+YYAdd.h"
#import "XLDefine.h"
@implementation SCUtils

+ (void)adjustButtonVerticalAlign:(UIButton *)button edge:(CGFloat)edge
{
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    
    CGSize size = [button.currentTitle sizeForFont:button.titleLabel.font size:CGSizeMake(0, MAXFLOAT) mode:NSLineBreakByCharWrapping];
    
    CGFloat heightEdge = (button.height - button.imageView.height - size.height) / 2;
    
    button.imageEdgeInsets = UIEdgeInsetsMake(heightEdge, (button.width - button.imageView.width) / 2, -(button.height - heightEdge - button.imageView.height), -(button.width - button.imageView.size.width) / 2);
    
    button.titleEdgeInsets = UIEdgeInsetsMake(heightEdge + button.imageView.height + edge, (button.width - size.width) / 2 - button.imageView.width, -(button.height - (heightEdge + button.imageView.height + edge) - size.height), 0);
}

+ (void)adjustButtonHorizontal:(UIButton *)button edge:(CGFloat)edge
{
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    CGSize size = [button.titleLabel.text sizeForFont:button.titleLabel.font size:CGSizeMake(MAXFLOAT, button.height) mode:NSLineBreakByCharWrapping];
    CGFloat labelLeft = (button.width - size.width - edge - button.imageView.width) / 2;
    button.titleEdgeInsets = UIEdgeInsetsMake(0, labelLeft - button.imageView.width, 0, - (labelLeft - button.imageView.width));
    button.imageEdgeInsets = UIEdgeInsetsMake(0, labelLeft + size.width + edge, 0, -(labelLeft + size.width + edge));
}

+ (UIButton *)createNavButtonWithTitle:(NSString *)title imgStr:(NSString *)imgStr
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 25, 44);
    button.titleLabel.font = kNormalSmallFont10;
//    颜色我修改了，以后有问题来这里找原因
    [button setTitleColor:XLNavContentColor forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imgStr] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [SCUtils adjustButtonVerticalAlign:button edge:3];
    [SCUtils dealNavItemButtonAutoranging:button];
    return button;
}

+ (void)dealNavItemButtonAutoranging:(UIButton *)button
{
    if (@available(iOS 9.0,*)) {
        [button.widthAnchor constraintEqualToConstant:button.size.width].active = true;
        [button.heightAnchor constraintEqualToConstant:button.size.height].active = true;
    }
}
//返回一条线
+ (UIView *)addLineView {
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor grayColor];
    return lineView;
}
@end
