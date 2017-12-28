//
//  XLHeadlineCell.m
//  Greece
//
//  Created by vzai on 2017/12/26.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "XLHeadlineCell.h"

@interface XLHeadlineCell ()
@property (nonatomic, strong) UIImageView *iconImgView;
@property (nonatomic, strong) UILabel *markLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *shareBtn;
@end
@implementation XLHeadlineCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.iconImgView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.iconImgView];
        
        self.titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.titleLabel];
        
        self.markLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.markLabel];
        
        self.shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.shareBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [self.shareBtn setTitle:@"分享" forState:UIControlStateNormal];
        [self.contentView addSubview:self.shareBtn];
        
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
            make.bottom.equalTo(self.contentView).offset(-10);
            
        }];
        
        CGFloat height = [self systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
    }
    return self;
}

- (void)confirmWithDic:(NSDictionary *)dic {
    
    self.iconImgView.image = [UIImage imageNamed:dic[@"imgStr1"]];
    self.titleLabel.text = dic[@"title"];
    self.markLabel.text = dic[@"mark"];
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
