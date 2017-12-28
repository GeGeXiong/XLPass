//
//  XLChineseCircleVC.m
//  Greece
//
//  Created by vzai on 2017/12/25.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "XLDefine.h"
#import "XLChineseCircleVC.h"
#import "SDCycleScrollView.h"
#import "CategoryBtnView.h"
#import "InformationView.h"
#import "XLLoginVC.h"
@interface XLChineseCircleVC ()<SDCycleScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIView *tableHeaderView;
@property (nonatomic, strong) InformationView *informationView;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation XLChineseCircleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"希腊通·旅游投资生活";
//    签到
    UIButton *signBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [signBtn setTitle:@"签到" forState:UIControlStateNormal];
    [signBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [signBtn addTarget:self action:@selector(sign) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:signBtn];
    self.navigationItem.rightBarButtonItem = item;

    [self loadTableViewHeadView];
    // Do any additional setup after loading the view.
}

- (void)sign {
    XLLoginVC *vc = [[XLLoginVC alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)loadTableViewHeadView {
    
    //    实例化首页头部背景视图
    self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1000)];
    self.tableHeaderView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.tableHeaderView];
    
    
    NSArray *imageNames = @[@"h1.jpg",
                            @"h2.jpg",
                            @"h3.jpg",
                            @"h4.jpg"];
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180) imageNamesGroup:imageNames];
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self.tableHeaderView addSubview:cycleScrollView];
    
    
//    WEAKSELF
//    NSArray *array = @[
//                       @(CategoryBtnViewTypeFirst),
//                       @(CategoryBtnViewTypeTwo),
//                       @(CategoryBtnViewTypeThree),
//                       @(CategoryBtnViewTypeFour),
//                       @(CategoryBtnViewTypeFive),
//                       @(CategoryBtnViewTypeSix),
//                       @(CategoryBtnViewTypeSeven),
//                       @(CategoryBtnViewTypeEight),
//                       @(CategoryBtnViewTypeNine),
//                       @(CategoryBtnViewTypeTen),
//                       @(CategoryBtnViewTypeEleven),
//                       @(CategoryBtnViewTypeTwelve),
//                       @(CategoryBtnViewTypeThirteen),
//                       @(CategoryBtnViewTypeFourteen),
//                       @(CategoryBtnViewTypeFifteen),
//                       @(CategoryBtnViewTypeSixteen),
//                       @(CategoryBtnViewTypeSeventeen),
//                       @(CategoryBtnViewTypeEightteen),
//                       @(CategoryBtnViewTypeNineteen),
//                       @(CategoryBtnViewTypeTwenty),
//                       ];
//    CategoryBtnView *categoryBtnView = [[CategoryBtnView alloc] initWithArray:array];
//    [categoryBtnView setFrame:CGRectMake(0, 180, SCREEN_WIDTH, 180)];
//    [self.tableHeaderView addSubview:categoryBtnView];
//    //    categoryBtnView.top = 0;
//    categoryBtnView.clickBlock = ^(CategoryBtnViewType type) {
//        //        [weak_self categoryClickWithType:type];
//    };
//
//
//    NSArray *infoArray = @[
//                           @{@"imgStr":@"icon_wechat", @"summary_title":@"绝对是绝世独立克己复礼是对肌肤脸上的肌肤立刻三", @"time":@"2012-11-08"},
//                           @{@"imgStr":@"icon_wechat", @"summary_title":@"绝对是绝世独立克己复礼是对肌肤脸上的肌肤立刻三", @"time":@"2012-11-08"},
//                           @{@"imgStr":@"icon_wechat", @"summary_title":@"绝对是绝世独立克己复礼是对肌肤脸上的肌肤立刻三", @"time":@"2012-11-08"},
//                           @{@"imgStr":@"icon_wechat", @"summary_title":@"绝对是绝世独立克己复礼是对肌肤脸上的肌肤立刻三", @"time":@"2012-11-08"},
//                           @{@"imgStr":@"icon_wechat", @"summary_title":@"绝对是绝世独立克己复礼是对肌肤脸上的肌肤立刻三", @"time":@"2012-11-08"},
//                           @{@"imgStr":@"icon_wechat", @"summary_title":@"绝对是绝世独立克己复礼是对肌肤脸上的肌肤立刻三", @"time":@"2012-11-08"},
//                           @{@"imgStr":@"icon_wechat", @"summary_title":@"绝对是绝世独立克己复礼是对肌肤脸上的肌肤立刻三", @"time":@"2012-11-08"},
//                           @{@"imgStr":@"icon_wechat", @"summary_title":@"绝对是绝世独立克己复礼是对肌肤脸上的肌肤立刻三", @"time":@"2012-11-08"},
//                           @{@"imgStr":@"icon_wechat", @"summary_title":@"绝对是绝世独立克己复礼是对肌肤脸上的肌肤立刻三", @"time":@"2012-11-08"}
//                           ];
//
//    NSInteger lineCount = 2;
//    CGFloat width = SCREEN_WIDTH / 2;
//    CGFloat height = 100;
//    for (int i = 0; i < 4; i++) {
//        self.informationView = [[InformationView alloc] init];
//        self.informationView.backgroundColor = [UIColor whiteColor];
//        NSDictionary *dic = [NSDictionary dictionary];
//        dic = infoArray[i];
//        [self.informationView configueWithInfoView:dic];
//        self.informationView.frame = CGRectMake(i % lineCount * width, i / lineCount * height + 400, width, height);
//        [self.tableHeaderView addSubview:self.informationView];
//    }
//
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.tableHeaderView = self.tableHeaderView;
    [self.view addSubview:self.tableView];
}
//加载首页头部视图
- (void)loadCategoryBtn {
//    通过判断枚举值，返回不同的字典（title和imgStr）
  

}
- (void)loadBannerView {
    
    
}

- (void)loadPracticalInformationView {
    
}

#pragma mark ------------------UITableViewDataSource--------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
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
