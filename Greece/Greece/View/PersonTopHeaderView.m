//
//  PersonTopHeaderView.m
//  Greece
//
//  Created by vzai on 2017/12/27.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "PersonTopHeaderView.h"

@implementation PersonTopHeaderView

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
//       头像
        UIImageView *headerImgView = [[UIImageView alloc] init];
        headerImgView.layer.cornerRadius = 28;
        headerImgView.layer.masksToBounds = YES;
        headerImgView.layer.borderColor = [UIColor colorWithRed:255.0 / 255.0 green:248.0 / 255.0 blue:63.0 / 255.0 alpha:1].CGColor;
        headerImgView.layer.borderWidth = 2;
        [self addSubview:headerImgView];
//        姓名
        UILabel *nameLabel = [[UILabel alloc] init];
//        nameLabel.font = [UIFont fontWithName:@"MicrosoftYaHei" size:16];
        nameLabel.font = [UIFont systemFontOfSize:16.0f];
        nameLabel.textColor = RGB(51, 51, 51);
        [self addSubview:nameLabel];
//        签名
        UILabel *signatureLabel = [[UILabel alloc] init];
        
//        signatureLabel.font = [UIFont fontWithName:@"MicrosoftYaHei" size:11];
        signatureLabel.font = [UIFont systemFontOfSize:11.0f];
        signatureLabel.textColor = RGB(153, 153, 153);
        signatureLabel.numberOfLines = 2;
        
        [self addSubview:signatureLabel];
        
        UIImageView *arrowImgView = [[UIImageView alloc] init];
        [arrowImgView setImage:[UIImage imageNamed:@"icon_small_arrow_right"]];
        [self addSubview:arrowImgView];
//        铃铛
        UIImageView *bellImgView = [[UIImageView alloc] init];
        [bellImgView setImage:[UIImage imageNamed:@"p_bell"]];
        [self addSubview:bellImgView];
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = RGB(229, 229, 229);
        [self addSubview:lineView];
//        会员
        UILabel *vipLabel = [self createBottomLabel];
//        vipLabel.font = [UIFont fontWithName:@"MicrosoftYaHei" size:5];
        vipLabel.font = [UIFont systemFontOfSize:12.0f];
        [self addSubview:vipLabel];
//        生日
        UILabel *birthdayLabel = [self createBottomLabel];
//        birthdayLabel.font = [UIFont fontWithName:@"MicrosoftYaHei" size:5];
        birthdayLabel.font = [UIFont systemFontOfSize:12.0f];
        birthdayLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:birthdayLabel];
//        星座
        UILabel *constellationLabel = [self createBottomLabel];
//        constellationLabel.font = [UIFont fontWithName:@"MicrosoftYaHei" size:5];
        constellationLabel.font = [UIFont systemFontOfSize:12.0f];
        constellationLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:constellationLabel];
        
        [headerImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(@(51 - 20));//-20 是减去状态栏的20的高度
            make.top.equalTo(@51);
            make.left.equalTo(@20);
            make.size.mas_equalTo(CGSizeMake(56, 56));
        }];
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(headerImgView.mas_right).offset(12);
            make.top.equalTo(headerImgView);
            make.right.lessThanOrEqualTo(arrowImgView.mas_left);
        }];
        
        [signatureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(nameLabel.mas_bottom).offset(7);
            make.left.equalTo(nameLabel);
            make.right.lessThanOrEqualTo(arrowImgView.mas_left).offset(-20);
        }];
        
        [arrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(7, 12));
            make.right.equalTo(self).offset(-20);
            make.centerY.equalTo(headerImgView);
        }];
        
        [bellImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(arrowImgView);
            make.bottom.equalTo(arrowImgView.mas_top).offset(-16);
        }];
        
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(headerImgView.mas_bottom).offset(20);
            make.height.equalTo(@1);
        }];
        
        [vipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(headerImgView);
            make.top.equalTo(lineView.mas_bottom).offset(16);
            make.width.equalTo(@[birthdayLabel,constellationLabel]);
            //设置高是因为headerView比较特殊 会挤压label 为了把header撑起了设置一个固定的高
            make.height.equalTo(@[@17,birthdayLabel,constellationLabel]);
            make.bottom.equalTo(self).offset(-16);
        }];
        
        [birthdayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vipLabel.mas_right).offset(5);
            make.top.equalTo(@[vipLabel,constellationLabel]);
        }];
        
        [constellationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(birthdayLabel.mas_right).offset(5);
            make.right.equalTo(self).offset(-20);
        }];
        
        CGFloat height = [self systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
        
        headerImgView.backgroundColor = [UIColor redColor];
        nameLabel.text = @"张某某";
        signatureLabel.text = @"如果你无法简介的表达你的想法，那只能说明你还不够了解他";
        vipLabel.text = [NSString stringWithFormat:@"会员：%@",@"金牌会员" ?: @""];//金牌会员这些是数据 但是要排除空的情况 用@""代替 以免出现null
        birthdayLabel.text = [NSString stringWithFormat:@"生日：%@",@"03-12" ?: @""];//同上
        constellationLabel.text = [NSString stringWithFormat:@"星座：%@",@"白羊" ?: @""];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (UILabel *)createBottomLabel
{
    UILabel *label = [[UILabel alloc] init];
//    label.font = [UIFont fontWithName:@"MicrosoftYaHei" size:12];
    label.textColor = RGB(51, 51, 5);
    [label setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    return label;
}

@end
