//
//  XLPersonTopVeiw.m
//  Greece
//
//  Created by vzai on 2017/12/25.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "XLPersonTopVeiw.h"

@interface XLPersonTopVeiw ()
@property (nonatomic, strong) UIImageView *headerImgView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *signatureLabel;
@property (nonatomic, strong) UIImageView *arrowImgView;
@property (nonatomic, strong) UIView *lineView;
@end

@implementation XLPersonTopVeiw

- (instancetype)initWithArray:(NSArray *)array {
    if (self = [super init]) {
//        self.backgroundColor = [UIColor redColor];
        self.headerImgView = [[UIImageView alloc] init];
        self.headerImgView.layer.cornerRadius = 28;
        self.headerImgView.layer.masksToBounds = YES;
        self.headerImgView.layer.borderColor = [UIColor colorWithRed:255.0 / 255.0 green:248.0 / 255.0 blue:63.0 / 255.0 alpha:1].CGColor;
        self.headerImgView.layer.borderWidth = 2;
//        self.headerImgView.backgroundColor = [UIColor blueColor];
        [self addSubview:self.headerImgView];
        
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.font = [UIFont fontWithName:@"MicrosoftYaHei" size:16];
        self.nameLabel.text = @"张某某";
//        self.nameLabel.backgroundColor = [UIColor blueColor];
        self.nameLabel.textColor = [UIColor colorWithRed:51 / 255.0 green:51 / 255.0 blue:51 / 255.0 alpha:1];
        [self addSubview:self.nameLabel];
        
        self.signatureLabel = [[UILabel alloc] init];
        self.signatureLabel.font = [UIFont fontWithName:@"MicrosoftYaHei" size:8];
        self.signatureLabel.text = @"大家分开了圣诞节福利空间的苏里科夫氮磷钾肥的";
        self.signatureLabel.numberOfLines = 0;
        self.signatureLabel.lineBreakMode = NSLineBreakByWordWrapping;
//        self.signatureLabel.backgroundColor = [UIColor blueColor];
        self.signatureLabel.textColor = [UIColor colorWithRed:153 / 255.0 green:153 / 255.0 blue:153 / 255.0 alpha:1];
        [self addSubview:self.signatureLabel];
        
        self.arrowImgView = [[UIImageView alloc] init];
        [self addSubview:self.arrowImgView];
        
        self.lineView = [SCUtils addLineView];
        [self addSubview:self.lineView];
        
            NSInteger lineCount = 3;
            CGFloat width = self.frame.size.width / 3;
            CGFloat heightLb = 15;
            UILabel *label;
            for (int i = 0; i < 3; i ++) {
                 label = [[UILabel alloc] init];
                [label setFrame:CGRectMake(i % lineCount *width, heightLb, width, heightLb)];
                label.text = @"会员：金牌会员";

                [self addSubview:label];
            }
             label.bottom = self.bottom;
        
        [self.headerImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self).offset(51);
            make.size.mas_equalTo(CGSizeMake(56, 56));
        }];
        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headerImgView.mas_right).offset(12);
            make.top.equalTo(self.headerImgView);
            make.size.mas_equalTo(CGSizeMake(100, 20));
            
        }];
        
        [self.signatureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.top.equalTo(self.nameLabel.mas_bottom).offset(7);
            make.size.mas_equalTo(CGSizeMake(250, 60));
            make.bottom.equalTo(self);
        }];
        
        [self.arrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.signatureLabel);
            make.right.equalTo(self.mas_right).offset(-20);
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
        
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(self.headerImgView.mas_bottom).offset(20);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 1));
            make.bottom.equalTo(self);
        }];
        
        CGFloat height = [self systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    }
    
    return self;
}






@end
