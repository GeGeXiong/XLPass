//
//  XLPracticalInfoCell.m
//  Greece
//
//  Created by vzai on 2017/12/28.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "XLPracticalInfoCell.h"

@interface XLPracticalInfoCell ()
@property (nonatomic, strong) UIImageView *iconImgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *shareBtn;
@end

@implementation XLPracticalInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.iconImgView = [[UIImageView alloc] init];
        self.iconImgView.image = [UIImage imageNamed:@"p_like"];
        [self.contentView addSubview:self.iconImgView];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.titleLabel.text = @"圣诞节轰趴聚会绝对是啊好吃的好玩的地方";
        self.titleLabel.textColor = RGB(51, 51, 51);
        [self.contentView addSubview:self.titleLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont systemFontOfSize:9];
        self.timeLabel.text = @"2017-12-22 18:36";
        self.timeLabel.textColor = RGB(153, 153, 153);
        [self.contentView addSubview:self.timeLabel];
        
        self.shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.shareBtn setImage:[UIImage imageNamed:@"p_like"] forState:UIControlStateNormal];
        [self.shareBtn setTitle:@"分享" forState:UIControlStateNormal];
        [self.shareBtn setTitleColor:RGB(153, 153, 153) forState:UIControlStateNormal];
        self.shareBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:self.shareBtn];
        
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@104);
        }];
        
        [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self).offset(12);
            make.size.mas_equalTo(CGSizeMake(108, 80));
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImgView);
            make.left.equalTo(self.iconImgView.mas_right).offset(10);
//            为啥一设置这句布局就乱了
            make.right.lessThanOrEqualTo(self).offset(-12);
        }];
        
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.bottom.equalTo(self.iconImgView);
        }];
        
        [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-12);
            make.bottom.equalTo(self).offset(-12);
        }];
    }
    return self;
}

- (void)confirmWithDic:(NSDictionary *)dic {
    self.iconImgView.image = [UIImage imageNamed:dic[@"imgStr1"]];
    self.titleLabel.text = dic[@"title"];
    self.timeLabel.text = dic[@"time"];
    [self.shareBtn setImage:[UIImage imageNamed:dic[@"imgStr2"]] forState:UIControlStateNormal];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
