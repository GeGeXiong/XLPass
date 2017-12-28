//
//  InformationView.m
//  BlueSky
//
//  Created by vzai on 2017/12/22.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "InformationView.h"

@interface InformationView ()
@property (nonatomic, strong) UIImageView *infoImageView;
@property (nonatomic, strong) UILabel *summaryLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@end

@implementation InformationView

- (instancetype) init {
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 100);
        self.infoImageView = [[UIImageView alloc] init];
        [self addSubview:self.infoImageView];
        
        self.summaryLabel = [[UILabel alloc] init];
        self.summaryLabel.text = @"djlsakdjflds";
        self.summaryLabel.textColor = [UIColor lightGrayColor];
        self.summaryLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.summaryLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.textColor = [UIColor lightGrayColor];
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.timeLabel];
        
        [self.infoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.top.equalTo(self).offset(10);
            make.size.mas_equalTo(CGSizeMake(90, 80));
        }];
        
        [self.summaryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.infoImageView.mas_right).offset(10);
            make.top.equalTo(self.infoImageView);
            make.right.equalTo(self).offset(-10);
            make.height.equalTo(@40);
        }];
        
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.summaryLabel);
            make.top.equalTo(self.summaryLabel.mas_bottom).offset(10);
            make.size.mas_equalTo(CGSizeMake(100, 30));
            make.bottom.equalTo(self);
        }];
    }
    
    return self;
}

- (void)configueWithInfoView:(NSDictionary *)dic {
    self.infoImageView.image = [UIImage imageNamed:dic[@"imgStr"]];
    self.summaryLabel.text = dic[@"summary_title"];
    self.timeLabel.text = dic[@"time"];
}


@end
