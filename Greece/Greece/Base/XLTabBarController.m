//
//  XLTabBarController.m
//  Greece
//
//  Created by vzai on 2017/12/25.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "XLTabBarController.h"
//自定义的导航控制器
#import "XLBaseNavigationController.h"
//中间tabbar的凸起按钮
#import "CYLPlusButtonSubclass.h"

#import "XLDefine.h"
@interface XLTabBarController ()<UITabBarControllerDelegate>

@end

@implementation XLTabBarController

- (instancetype)init {
    self = [super init];
    if (self) {
        NSMutableArray *mArray = [NSMutableArray array];
        NSArray *arr = @[@{@"title":@"希腊圈",
                           @"image":@"icon_normal_1",
                           @"hl_image":@"icon_select_1",
                           @"class":@"XLChineseCircleVC"
                           },
                         @{@"title":@"头条",
                           @"image":@"icon_normal_2",
                           @"hl_image":@"icon_select_2",
                           @"class":@"XLHeadlineVC"
                           },
                         @{@"title":@"发布",
                           @"image":@"icon_normal_3",
                           @"hl_image":@"icon_select_3",
                           @"class":@"XLMiddleVC"
                           },
                         @{@"title":@"预约",
                           @"image":@"icon_normal_4",
                           @"hl_image":@"icon_select_4",
                           @"class":@"XLMessageVC"
                           },
                         @{@"title":@"我的",
                           @"image":@"icon_normal_5",
                           @"hl_image":@"icon_select_5",
                           @"class":@"XLPersonVC"
                           }];
        
        for (int i = 0; i < arr.count; i++) {
            NSDictionary *dic = arr[i];
            UIViewController *vc = [[NSClassFromString(dic[@"class"]) alloc] init];
            XLBaseNavigationController *nav = [[XLBaseNavigationController alloc] initWithRootViewController:vc];
//            不需要渲染，原图显示
            nav.tabBarItem.image = [[UIImage imageNamed:dic[@"image"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//            不需要渲染，原图显示
            nav.tabBarItem.selectedImage = [[UIImage imageNamed:dic[@"hl_image"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            vc.title = dic[@"title"];
            [mArray addObject:nav];
        }
        self.viewControllers = mArray;
        self.tabBar.tintColor = XLTabBarTitleColorNormal;
        self.tabBar.barTintColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
