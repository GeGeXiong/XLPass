//
//  XLPersonVC.m
//  Greece
//
//  Created by vzai on 2017/12/25.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "XLPersonVC.h"
#import "XLDefine.h"
#import "XLPersonTopVeiw.h"
//顶部视图
#import "PersonTopHeaderView.h"
#import "XLAccountSafeVC.h"
@interface XLPersonVC ()<UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;
//@property (nonatomic, strong) XLPersonTopVeiw *persnTopView;
@end

@implementation XLPersonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [NSArray array];
    self.dataArray = @[@{@"imgStr":@"p_safe", @"title":@"账户安全"},
                       @{@"imgStr":@"p_wallet", @"title":@"我的钱包"},
                       @{@"imgStr":@"p_vip", @"title":@"金牌会员"},
                       @{@"imgStr":@"p_order", @"title":@"我的预约"},
                       @{@"imgStr":@"p_post", @"title":@"帖子记录"},
                       @{@"imgStr":@"p_join", @"title":@"我的参与"},
                       @{@"imgStr":@"p_work", @"title":@"我的任务"},
                       @{@"imgStr":@"p_like", @"title":@"我的收藏"},
                       @{@"imgStr":@"p_share", @"title":@"分享APP"},
                       @{@"imgStr":@"p_complaint", @"title":@"投诉建议"},
                       ];
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 600) style:UITableViewStylePlain];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//    ;
//    [self.view addSubview:self.tableView];
    [self loadTableView];
//    self.persnTopView = [[XLPersonTopVeiw alloc] initWithArray:nil];
//    self.tableView.tableHeaderView = self.persnTopView;
    
    UIButton *signOutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [signOutBtn setTitle:@"退出" forState:UIControlStateNormal];
    [signOutBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    signOutBtn.backgroundColor = XLBtnOrangeColor;
    [signOutBtn setFrame:CGRectMake((SCREEN_WIDTH - 335) / 2, 32, 335, 44)];
    
    UIView *footerView = [[UIView alloc] init];
    footerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 100);
//    footerView.backgroundColor = XLAllViewControllerBackgroundColor;
    [footerView addSubview:signOutBtn];
    self.tableView.tableFooterView = footerView;
    self.tableView.tableFooterView.backgroundColor = XLAllViewControllerBackgroundColor;
    
    
//    设置导航控制器的代理
    self.navigationController.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)loadTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 45;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    WEAKSELF
    PersonTopHeaderView *headerView = [[PersonTopHeaderView alloc] init];
//    headerView.tapBlock = ^{
//        [weak_self goToForgetPwdViewController];
//    };
    tableView.tableHeaderView = headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
//
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
//    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
//    去掉点击效果
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.imageView.image = [UIImage imageNamed:self.dataArray[indexPath.section][@"imgStr"]];
    cell.textLabel.text = self.dataArray[indexPath.section][@"title"];
    if ([cell.textLabel.text isEqualToString:@"金牌会员"]) {
        cell.detailTextLabel.text = @"注册成为金牌会员，您就可以接各类相关任务啦";
        cell.detailTextLabel.font = [UIFont systemFontOfSize:10.0f];
        cell.detailTextLabel.textColor = RGB(180, 182, 182);
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
//    判断第一个cell距离header的距离
    if (section == 0) {
        return 10;
    }
    return 0.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    switch (indexPath.section) {
            
        case 0:
        {
            XLAccountSafeVC *safeVC =  [[XLAccountSafeVC alloc] init];
            safeVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:safeVC animated:YES];
        }
            break;
            
            //        case 1:
            //            <#statements#>
            //            break;
            //
            //        case 2:
            //            <#statements#>
            //            break;
            
        default:
            break;
    }
}
//隐藏导航栏
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated  {
    BOOL isHiddenNavBar = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isHiddenNavBar];
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
