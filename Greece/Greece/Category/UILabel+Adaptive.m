//
//  UILabel(Adaptive).m
//  Greece
//
//  Created by vzai on 2017/12/27.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import "UILabel+Adaptive.h"

@implementation UILabel (Adaptive)

- (CGSize)sizeAdaptiveWithText:(NSString *)text textFont:(UIFont *)font textMaxSzie:(CGSize)size {
    self.text = text;
    self.font = font;
    
    NSMutableAttributedString *attributeText = [[NSMutableAttributedString alloc]initWithString:self.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.maximumLineHeight = 60;
    paragraphStyle.lineSpacing = 8;
    
    [attributeText addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributeText;
    self.lineBreakMode = NSLineBreakByTruncatingTail;//label的换行模式
    self.numberOfLines = 0;// 设置行数，0表示没有限制
    CGSize maxSzie = size;//设置label的最大size
    [self sizeToFit];
    CGSize labelSize = [self sizeThatFits:maxSzie];//最终自适应得到的label的尺寸。
    return labelSize;
    
}
@end
