//
//  XLHeadlineVC.m
//  Greece
//
//  Created by vzai on 2017/12/25.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "XLHeadlineVC.h"
#import "XLPracticalInfoCell.h"
#import "SDCycleScrollView.h"
@interface XLHeadlineVC ()<UITableViewDelegate, UITableViewDataSource, SDCycleScrollViewDelegate>
@property (nonatomic, strong) UIView *tableHeaderView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
//@property (nonatomic, strong) SDCycleScrollView *
@end

@implementation XLHeadlineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 45;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    [self.view addSubview:self.tableView];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.dataArray = [NSArray array];
    self.dataArray = @[@{@"imgStr1":@"h1.jpg", @"title":@"是的快捷方式大家发了快递就放假了多少积分", @"time":@"2017-12-22 18:36", @"imgStr2":@"p_like"},
                       @{@"imgStr1":@"h2.jpg", @"title":@"是的快捷方式大家发了快递就放假了多少积分", @"time":@"2017-12-22 18:36", @"imgStr2":@"p_like"},
                       @{@"imgStr1":@"h3.jpg", @"title":@"是的快捷方式大家发了快递就放假了多少积分", @"time":@"2017-12-22 18:36", @"imgStr2":@"p_like"},
                       @{@"imgStr1":@"h4.jpg", @"title":@"是的快捷方式大家发了快递就放假了多少积分", @"time":@"2017-12-22 18:36", @"imgStr2":@"p_like"},
                       ];
    
    
    [self loadTableViewHeader];
    // Do any additional setup after loading the view.
}

- (void)loadTableViewHeader {
    
    self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180)];
    self.tableHeaderView.backgroundColor = [UIColor cyanColor];
//    [self.view addSubview:self.tableHeaderView];
    
    
    NSArray *imageNames = @[@"h1.jpg",
                            @"h2.jpg",
                            @"h3.jpg",
                            @"h4.jpg"];
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180) imageNamesGroup:imageNames];
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    [self.tableHeaderView addSubview:cycleScrollView];
    
    [self.view addSubview:self.tableView];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identfier = @"cell";
    XLPracticalInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identfier];
    if (!cell) {
        cell = [[XLPracticalInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identfier];
        
    }
    [cell confirmWithDic:self.dataArray[indexPath.section]];
    NSLog(@"%ld", indexPath.section);
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
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
