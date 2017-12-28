//
//  CategoryBtnView.m
//  Greece
//
//  Created by vzai on 2017/12/25.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "CategoryBtnView.h"

@implementation CategoryBtnView

- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        self.width = SCREEN_WIDTH;
        
        
        NSInteger lineCount = 5;
        CGFloat width = self.width / 5.0;
        CGFloat height = 80;
        for (int i = 0; i < array.count; i ++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(i % lineCount * width, i / lineCount * height, width, height);
            CategoryBtnViewType type = [array[i] integerValue];
            NSDictionary *dic = [self contentWithType:type];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            button.titleLabel.textColor = [UIColor lightGrayColor];
            [button setTitle:dic[@"title"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:dic[@"imgStr"]] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [SCUtils adjustButtonVerticalAlign:button edge:5];
            button.tag = type;
            [self addSubview:button];
            if (i == array.count - 1) {
                self.height = button.bottom;
            }
        }
    }
    return self;
}

- (void)buttonAction:(UIButton *)button
{
    if (self.clickBlock) {
        self.clickBlock(button.tag);
    }
    
}

- (NSDictionary *)contentWithType:(CategoryBtnViewType)type
{
    NSString *title = @"";
    NSString *imgStr = @"";
    switch (type) {
        case CategoryBtnViewTypeFirst:
            title = @"手机充值";
            imgStr = @"icon_warning_3";
            break;
        case CategoryBtnViewTypeTwo:
            title = @"居留查询";
            imgStr = @"icon_warning_3";
            break;
        case CategoryBtnViewTypeThree:
            title = @"税号查询";
            imgStr = @"icon_warning_3";
            break;
        case CategoryBtnViewTypeFour:
            title = @"商品出售";
            imgStr = @"icon_warning_3";
            break;
        case CategoryBtnViewTypeFive:
            title = @"投资机会";
            imgStr = @"icon_warning_3";
            break;
        case CategoryBtnViewTypeSix:
            title = @"招聘求职";
            imgStr = @"icon_warning_3";
            break;
        case CategoryBtnViewTypeSeven:
            title = @"有偿带物";
            imgStr = @"icon_warning_3";
            break;
            
        case CategoryBtnViewTypeEight:
            title = @"房屋租赁";
            imgStr = @"icon_warning_3";
            break;
            
        case CategoryBtnViewTypeNine:
            title = @"求助咨询";
            imgStr = @"icon_warning_3";
            break;
            
        case CategoryBtnViewTypeTen:
            title = @"代购需求";
            imgStr = @"icon_warning_3";
            break;
    }
    return @{@"title":title, @"imgStr":imgStr};
}
@end
