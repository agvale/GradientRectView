//
//  ZAGradientRectView.h
//  FYwater
//
//  Created by zhiang on 2019/3/16.
//  Copyright © 2019 fugui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 渐变色圆环
 */
@interface ZAGradientRectView : UIView

/**
 设置环属性
 
 @param r 比率 0～1
 @param sc 开始的颜色
 @param ec 结束的颜色
 */
- (void)setRate:(CGFloat) r startColor:(UIColor *)sc endColor:(UIColor *)ec ;

@end

NS_ASSUME_NONNULL_END
