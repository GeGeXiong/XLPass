//
//  MPHomeViewController.m
//  MobileProject
//
//  Created by wujunyang on 16/7/1.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#import "MPHomeViewController.h"
#import "CYLPlusButtonSubclass.h"
#import "HomeVC.h"
#import "MaintenanceVC.h"
#import "ViewController.h"
#import "MineVC.h"
#import "DynamicVC.h"
@implementation MPHomeViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        
        [self setupTabBarController];
        
//        self.tabBar.selectedImageTintColor =RGB(182, 65, 65);
        
        //显示未读
//        UINavigationController  *discoverNav =(UINavigationController *)self.viewControllers[1];
//        UITabBarItem *curTabBarItem=discoverNav.tabBarItem;
//        [curTabBarItem setBadgeValue:@"2"];
//
    }
    return self;
}


- (void)setupTabBarController {
    /// 设置TabBar属性数组
    self.tabBarItemsAttributes =[self tabBarItemsAttributesForController];
    
    /// 设置控制器数组
    self.viewControllers =[self mpViewControllers];
//    self.tabBarHeight=500;
    
    self.delegate = self;
    self.moreNavigationController.navigationBarHidden = YES;
    
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = ColorValue(0x00DEBB);
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tapbar_top_line"]];
    
    
}


//控制器设置
- (NSArray *)mpViewControllers {
    HomeVC *firstViewController = [[HomeVC alloc] init];
    MPBaseNavigationController *firstNavigationController = [[MPBaseNavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    
    MaintenanceVC *secondViewController = [[MaintenanceVC alloc] init];
    MPBaseNavigationController *secondNavigationController = [[MPBaseNavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    ViewController *fourthViewController = [[ViewController alloc] init];
    MPBaseNavigationController *fourthNavigationController = [[MPBaseNavigationController alloc]
                                                    initWithRootViewController:fourthViewController];
    MineVC *fiveViewController = [[MineVC alloc] init];
    MPBaseNavigationController *fiveNavigationController = [[MPBaseNavigationController alloc]
                                                  initWithRootViewController:fiveViewController];
    
    
    NSArray *viewControllers = @[
                                 firstNavigationController,
                                 secondNavigationController,
                                 //                                 thirdNavigationController,
                                 fourthNavigationController,
                                 fiveNavigationController
                                 ];
    return viewControllers;
}

//TabBar文字跟图标设置
- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"维修单",
                                                 CYLTabBarItemImage : @"tabbar_wxd",  /* NSString and UIImage are supported*/
                                                 CYLTabBarItemSelectedImage : @"tabbar_wxd2", /* NSString and UIImage are supported*/
                                                 };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"维护",
                                                  CYLTabBarItemImage : @"tabbar_wh",
                                                  CYLTabBarItemSelectedImage : @"tabbar_wh2",
                                                  };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"动态",
                                                  CYLTabBarItemImage : @"tabbar_dt",
                                                  CYLTabBarItemSelectedImage : @"tabbar_dt2"
                                                  };
    NSDictionary *fiveTabBarItemsAttributes = @{
                                                CYLTabBarItemTitle : @"我的",
                                                CYLTabBarItemImage : @"tabbar_wd",
                                                CYLTabBarItemSelectedImage : @"tabbar_wd2"
                                                };
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       //                                       thirdTabBarItemsAttributes,
                                       fourthTabBarItemsAttributes,
                                       fiveTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}


#pragma mark - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController*)tabBarController shouldSelectViewController:(UINavigationController*)viewController {
    /// 特殊处理 - 是否需要登录
//    BOOL isBaiDuService = [viewController.topViewController isKindOfClass:[MPDiscoveryViewController class]];
//    if (isBaiDuService) {
//        NSLog(@"你点击了TabBar第二个");
//    }
    
        BOOL isb=[viewController.topViewController isKindOfClass:[ViewController class]];
        if (isb) {
            DynamicVC *vc=[[DynamicVC alloc]init];
    //        vc.type=1;
            UIViewController *fourthNavigationController = [[UINavigationController alloc]
                                                            initWithRootViewController:vc];
    
//            [self.window.rootViewController presentViewController:vc animated:YES completion:nil];
//            RegisterVC *mVC = [[RegisterVC alloc] init];
 [self presentViewController:fourthNavigationController animated:YES completion:nil];
                    return NO;
                }
    
    return YES;
}
@end
