//
//  XLWalletVC.m
//  Greece
//
//  Created by vzai on 2017/12/27.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "XLWalletVC.h"

@interface XLWalletVC ()
@property (nonatomic, strong) UIImageView *topImgView;

@end

@implementation XLWalletVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setUpTopView {
    UIView *bgView1 = [[UIView alloc] init];
    bgView1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView1];
    
    UILabel *coinLabel = [[UILabel alloc] init];
    coinLabel.textColor = RGB(51, 51, 51);
    coinLabel.text = @"我的金币";
    coinLabel.textAlignment = NSTextAlignmentCenter;
    coinLabel.font = [UIFont systemFontOfSize:14];
    [bgView1 addSubview:coinLabel];
    
    UILabel *moneyLabel = [[UILabel alloc] init];
    moneyLabel.textColor = RGB(51, 51, 51);
    moneyLabel.text = @"18000";
    moneyLabel.textAlignment = NSTextAlignmentCenter;
    moneyLabel.font = [UIFont systemFontOfSize:14];
    [bgView1 addSubview:moneyLabel];
    
    
    UIView *bgView2 = [[UIView alloc] init];
    bgView2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView2];
    
    UILabel *moneyNumLabel = [[UILabel alloc] init];
    moneyNumLabel.textColor = RGB(51, 51, 51);
    moneyNumLabel.text = @"18000";
    moneyNumLabel.textAlignment = NSTextAlignmentCenter;
    moneyNumLabel.font = [UIFont systemFontOfSize:14];
    [bgView1 addSubview:moneyNumLabel];
//    self.
    
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
