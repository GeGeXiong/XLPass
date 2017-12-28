//
//  XLBaseViewController.m
//  Greece
//
//  Created by vzai on 2017/12/25.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "XLBaseViewController.h"
#import "XLDefine.h"
@interface XLBaseViewController ()

@end

@implementation XLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    //方法1.创建一个UIButton
//    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
//    //设置UIButton的图像
//    [backButton setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
//    //给UIButton绑定一个方法，在这个方法中进行popViewControllerAnimated
//    [backButton addTarget:self action:@selector(backItemClick) forControlEvents:UIControlEventTouchUpInside];
//    //然后通过系统给的自定义BarButtonItem的方法创建BarButtonItem
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
//    //覆盖返回按键
//    self.navigationItem.leftBarButtonItem = backItem;

    //方法2:通过父视图NaviController来设置
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@""
                                                                style:UIBarButtonItemStylePlain
                                                               target:nil
                                                               action:nil];
    self.navigationController.navigationBar.tintColor =
    [UIColor blackColor];
    //主要是以下两个图片设置
    self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"icon_back"];
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"icon_back"];
    self.navigationItem.backBarButtonItem = backItem;
    
    self.view.backgroundColor = XLAllViewControllerBackgroundColor;
    // Do any additional setup after loading the view.
}

- (void)backItemClick {
    [self.navigationController popViewControllerAnimated:YES];
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
