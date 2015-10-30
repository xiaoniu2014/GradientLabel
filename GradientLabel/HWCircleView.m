//
//  HWCircleView.m
//  GradientLabel
//
//  Created by hw on 15/10/30.
//  Copyright © 2015年 hongw. All rights reserved.
//

#import "HWCircleView.h"

@interface HWCircleView()

@property (nonatomic,strong) CAShapeLayer *shapeLayer;

@end

@implementation HWCircleView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat w = 100;
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.position = self.center;
        layer.bounds = CGRectMake(0, 0, w, w);
        [self.layer addSublayer:layer];
        
        self.shapeLayer = layer;
        
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(w*0.5, w*0.5) radius:w*0.5-10 startAngle:0 endAngle:M_PI_2 clockwise:YES];
        layer.path = path.CGPath;
        layer.lineWidth = 10;
        layer.lineCap = kCALineCapRound;
        layer.fillColor = [UIColor clearColor].CGColor;
        layer.strokeColor = [UIColor greenColor].CGColor;
        
        
        CAGradientLayer *mask = [[CAGradientLayer alloc] init];
        mask.frame = layer.bounds;
        
        mask.colors = @[(id)[UIColor whiteColor].CGColor,
                        (id)[UIColor clearColor].CGColor];
        mask.startPoint = CGPointMake(0.5, 0.5);
        mask.endPoint = CGPointMake(1, 0.5);
        layer.mask = mask;
    }
    return self;
}

+ (HWCircleView *)showAnimationWithSuperView:(UIView *)superView{
    
    HWCircleView *circleView = [[self alloc] initWithFrame:superView.frame];
    
    [superView addSubview:circleView];
    
    CABasicAnimation *animtaion = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animtaion.duration = 1;
    animtaion.repeatCount = MAXFLOAT;
    animtaion.toValue = @(M_PI * 2);
    animtaion.removedOnCompletion = NO;
    animtaion.fillMode = kCAFillModeBackwards;
    [circleView.shapeLayer addAnimation:animtaion forKey:nil];
    
    
    return circleView;
}

@end
