//
//  SCUtils.h
//  BlueSky
//
//  Created by liwenyan on 2017/12/21.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SCUtils : NSObject

+ (void)adjustButtonVerticalAlign:(UIButton *)button edge:(CGFloat)edge;

+ (void)adjustButtonHorizontal:(UIButton *)button edge:(CGFloat)edge;

+ (UIButton *)createNavButtonWithTitle:(NSString *)title imgStr:(NSString *)imgStr;
//处理iOS11自定义nav item 自动偏移
+ (void)dealNavItemButtonAutoranging:(UIButton *)button;

//返回一条线
+ (UIView *)addLineView;
@end
