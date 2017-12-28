//
//  XLDefine.h
//  Greece
//
//  Created by vzai on 2017/12/25.
//  Copyright © 2017年 vzai. All rights reserved.
//

#ifndef XLDefine_h
#define XLDefine_h
#import "UIColor+YYAdd.h"
#define XLNavTitleColor         [UIColor blackColor]
#define XLNavContentColor       [UIColor blackColor]

#define SCREEN_WIDTH            MIN(CGRectGetWidth([[UIScreen mainScreen] bounds]),CGRectGetHeight([[UIScreen mainScreen] bounds]))

#define SCREEN_HEIGHT           MAX(CGRectGetWidth([[UIScreen mainScreen] bounds]),CGRectGetHeight([[UIScreen mainScreen] bounds]))

//暂用，以后修改
#define kNormalContentFont15    [UIFont systemFontOfSize:15]
#define kNormalSmallFont12      [UIFont systemFontOfSize:12]
#define kNormalSmallFont10      [UIFont systemFontOfSize:10]
#define kColorGray99        [UIColor colorWithHexString:@"#999999"]
#define XLAllViewControllerBackgroundColor      [UIColor colorWithHexString:@"#f2f2f2"]
#define XLButtonBackgroundColor                 [UIColor colorWithRed:255.0 / 255.0 green:248.0 / 255.0 blue:63.0 / 255.0 alpha:1]

//按钮背景填充色
#define XLBtnOrangeColor         [UIColor colorWithRed:255.0 / 255.0 green:216.0 / 255.0 blue:71.0 / 255.0 alpha:1]

#define XLTabBarTitleColorNormal                  [UIColor colorWithHexString:@"#666666"]

#define RGB(x, y, z)     [UIColor colorWithRed:x/255.0 green:y/255.0 blue:z/255.0 alpha:1.0]
#define RGBA(x, y, z)    [UIColor colorWithRed:x/255.0 green:y/255.0 blue:z/255.0 alpha:a]

#endif /* XLDefine_h */
