//
//  YSMacro.h
//  TemplateDemo
//
//  Created by 李文焱 on 16/1/16.
//  Copyright © 2016年 sure. All rights reserved.
//

#ifndef SCMacro_h
#define SCMacro_h
//相对于375屏幕的缩放比例
#define kScreenWidthBase 375.0f
#define kScreenScale  ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 1 :([[UIScreen mainScreen] bounds].size.width / kScreenWidthBase))

// Screen Size
#define SCREEN_WIDTH			MIN(CGRectGetWidth([[UIScreen mainScreen] bounds]),CGRectGetHeight([[UIScreen mainScreen] bounds]))
#define SCREEN_HEIGHT           MAX(CGRectGetWidth([[UIScreen mainScreen] bounds]),CGRectGetHeight([[UIScreen mainScreen] bounds]))

#define isSimulator         (NSNotFound != [[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location)
#define isIphone            (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define isIpad              (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define isIPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? [[UIScreen mainScreen] currentMode].size.height == 2436 : NO)

//当前软件版本号
#define BundleShortVersionString    [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

// 设置ARBG
#define COLOR_WITH_ARGB(R,G,B,A)            [UIColor colorWithRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:A]
#define COLOR_WITH_RGB(R,G,B)               [UIColor colorWithRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:1]
#define COLOR_WITH_IMAGENAME(imageName)     [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]]

#define Status_Height CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame])
// 导航栏高度
//#define NAVIGATION_HEIGHT (CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame]) + CGRectGetHeight(self.navigationController.navigationBar.frame))
#define NAVIGATION_HEIGHT (CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame]) + 44)
// 底部宏
#define SafeAreaBottomHeight (SCREEN_HEIGHT == 812.0 ? 34 : 0)

#define WEAK_REF(obj) \
__weak typeof(obj) weak_##obj = obj; \

#define WEAKSELF \
__weak typeof(self) weak_self = self; \

#endif /* SCMacro_h */
