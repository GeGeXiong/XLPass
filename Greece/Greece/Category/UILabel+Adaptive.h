//
//  UILabel(Adaptive).h
//  Greece
//
//  Created by vzai on 2017/12/27.
//  Copyright © 2017年 vzai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UILabel (Adaptive)

- (CGSize)sizeAdaptiveWithText:(NSString *)text textFont:(UIFont *)font textMaxSzie:(CGSize)size;

@end
