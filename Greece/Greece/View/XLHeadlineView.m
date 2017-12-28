//
//  XLHeadlineView.m
//  Greece
//
//  Created by vzai on 2017/12/26.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "XLHeadlineView.h"

@interface XLHeadlineView ()
@property (nonatomic, strong) UIImageView *iconImgView;
@property (nonatomic, strong) UILabel *markLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *shareBtn;
@end
@implementation XLHeadlineView

- (instancetype)initWithArray:(NSArray *)array {
    if (self = [super init]) {
        self.iconImgView = [[UIImageView alloc] init];
        [self addSubview:self.iconImgView];
        
        self.titleLabel = [[UILabel alloc] init];
        [self addSubview:self.titleLabel];
        
        self.markLabel = [[UILabel alloc] init];
        [self addSubview:self.markLabel];
        
        self.shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.shareBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [self.shareBtn setTitle:@"分享" forState:UIControlStateNormal];
        [self addSubview:self.shareBtn];
        
        [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.top.equalTo(self).offset(10);
            make.bottom.equalTo(self).offset(-10);
            make.size.mas_equalTo(CGSizeMake(150, 120));
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImgView.mas_right).offset(10);
            make.top.equalTo(self.iconImgView);
            make.right.equalTo(self).offset(-50);
            make.height.equalTo(@60);
        }];
        
        [self.markLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(50);
            make.size.mas_equalTo(CGSizeMake(100, 30));
        }];
        
        [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-10);
            make.top.equalTo(self.markLabel);
            make.size.mas_equalTo(CGSizeMake(100, 40));
            make.bottom.equalTo(self).offset(-10);
        }];
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
