//
//  ZAGradientRectView.m
//  FYwater
//
//  Created by zhiang on 2019/3/16.
//  Copyright © 2019 fugui. All rights reserved.
//

#import "ZAGradientRectView.h"


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define DEFAULT_LINE_WIDTH  8.0

@interface ZAGradientRectView ()


@end


@implementation ZAGradientRectView

- (void)setRate:(CGFloat) r startColor:(UIColor *)sc endColor:(UIColor *)ec {
    
    CGFloat W = self.frame.size.width;
    CGFloat H = self.frame.size.height;
    
    //圆环背景View
    UIView *cricleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, W, H)];
    [self addSubview:cricleView];
    
    //灰色的圆环
    CAShapeLayer *fullCricleLayer = [[CAShapeLayer alloc] init];
    fullCricleLayer.strokeColor = UIColorFromRGB(0xE7E7E7).CGColor;
    fullCricleLayer.fillColor = [UIColor clearColor].CGColor;
    fullCricleLayer.lineWidth = DEFAULT_LINE_WIDTH;
    fullCricleLayer.lineCap = kCALineCapRound;
    UIBezierPath *fullPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(W/2, H/2) radius:(W - DEFAULT_LINE_WIDTH)/2 startAngle:0 endAngle:2*M_PI clockwise:YES];
    fullCricleLayer.path = fullPath.CGPath;
    [cricleView.layer addSublayer:fullCricleLayer];
    
    //表示进度的圆环
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.strokeColor = [UIColor redColor].CGColor;
    maskLayer.fillColor = [UIColor clearColor].CGColor;
    maskLayer.lineWidth = DEFAULT_LINE_WIDTH;
    maskLayer.lineCap = kCALineCapRound;
    CGFloat allCorrectPercent = r;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(W/2, H/2) radius:(W - DEFAULT_LINE_WIDTH)/2 startAngle:3*M_PI_2 endAngle:allCorrectPercent * 2 * M_PI - M_PI_2 clockwise:YES];
    maskLayer.path = path.CGPath;
    
    //渐变颜色
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    gradientLayer.frame = cricleView.bounds;
    [gradientLayer setColors:[NSArray arrayWithObjects:(id)sc.CGColor,(id)ec.CGColor, nil]];
    gradientLayer.startPoint = [self getPointWithAngle:3*M_PI_2];
    gradientLayer.endPoint = [self getPointWithAngle:allCorrectPercent * 2 * M_PI - M_PI_2];
    
    [cricleView.layer addSublayer:gradientLayer];
    [gradientLayer setMask:maskLayer];
}

//根据角度来计算进度圆环的起点和终点
-(CGPoint)getPointWithAngle:(CGFloat)angle
{
    CGFloat W = self.frame.size.width;
    CGFloat H = self.frame.size.height;
    CGFloat radius = (W - DEFAULT_LINE_WIDTH) / 2;//半径
    int index = (angle) / M_PI_2;
    CGFloat needAngle = angle - index * M_PI_2;
    CGFloat x = 0, y = 0;
    
    if (angle >= 3 * M_PI_2) {//第一象限
        x = radius + sinf(needAngle) * radius;
        y = radius - cosf(needAngle) * radius;
    } else if (angle >= 0 && angle < M_PI_2) {//第二象限
        x = radius + cosf(needAngle) * radius;
        y = radius + sinf(needAngle) * radius;
    } else if (angle >= M_PI_2 && angle < M_PI) {//第三象限
        x = radius - sinf(needAngle) * radius;
        y = radius + cosf(needAngle) * radius;
    } else if (angle >= M_PI && angle < 3 * M_PI_2) {//第四象限
        x = radius - cosf(needAngle) * radius;
        y = radius - sinf(needAngle) * radius;
    }
    
    CGPoint point = CGPointMake(x/W, y/H);
    return  point;
}

@end
