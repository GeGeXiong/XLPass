//
//  CategoryBtnView.h
//  Greece
//
//  Created by vzai on 2017/12/25.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "XLBaseView.h"

typedef NS_OPTIONS(NSInteger, CategoryBtnViewType) {
    CategoryBtnViewTypeFirst = 1,
    CategoryBtnViewTypeTwo,
    CategoryBtnViewTypeThree,
    CategoryBtnViewTypeFour,
    CategoryBtnViewTypeFive,
    CategoryBtnViewTypeSix,
    CategoryBtnViewTypeSeven,
    CategoryBtnViewTypeEight,
    CategoryBtnViewTypeNine,
    CategoryBtnViewTypeTen,
    CategoryBtnViewTypeEleven,
    CategoryBtnViewTypeTwelve,
    CategoryBtnViewTypeThirteen,
    CategoryBtnViewTypeFourteen,
    CategoryBtnViewTypeFifteen,
    CategoryBtnViewTypeSixteen,
    CategoryBtnViewTypeSeventeen,
    CategoryBtnViewTypeEightteen,
    CategoryBtnViewTypeNineteen,
    CategoryBtnViewTypeTwenty
};
@interface CategoryBtnView : XLBaseView

@property (nonatomic, copy) void(^clickBlock)(CategoryBtnViewType type);
- (instancetype)initWithArray:(NSArray *)array;
@end
