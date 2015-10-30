//
//  HWProgressView.m
//  GradientLabel
//
//  Created by hw on 15/10/30.
//  Copyright © 2015年 hongw. All rights reserved.
//

#import "HWProgressView.h"

@interface HWProgressView()

@property (nonatomic, strong) CALayer *maskLayer;

@property (nonatomic,strong) NSMutableArray *colors;

@end

@implementation HWProgressView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        CAGradientLayer *layer = (id)[self layer];
        layer.startPoint = CGPointMake(0.0, 0.5);
        layer.endPoint = CGPointMake(1.0, 0.5);
        layer.colors = self.colors;
        
        
        CALayer *mask = [CALayer layer];
        CGRect frame = self.bounds;
        frame.size.width = 0;
        mask.frame = frame;
        mask.backgroundColor = [UIColor whiteColor].CGColor;
        layer.mask = mask;
        self.maskLayer = mask;
    }
    return self;
}


- (void)performAnimation{
    id lastObject = self.colors.lastObject;
    [self.colors removeLastObject];
    [self.colors insertObject:lastObject atIndex:0];
    
    CAGradientLayer *gradientLayer = (CAGradientLayer *)[self layer];
    gradientLayer.colors = self.colors;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"colors"];
    
    animation.duration = 0.01;
    animation.toValue = self.colors;
    animation.delegate = self;
    [self.layer addAnimation:animation forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self performAnimation];
}


- (CALayer *)maskLayer{
    if (!_maskLayer) {
        _maskLayer = [CALayer layer];
    }
    return _maskLayer;
}

- (NSMutableArray *)colors{
    if (!_colors) {
        _colors = [[NSMutableArray alloc] initWithCapacity:51];
        for (int i = 0; i < 255; i+=5) {
            UIColor *color = [UIColor colorWithHue:i/255.0f
                                        saturation:1.0
                                        brightness:1.0
                                             alpha:1.0];
            [_colors addObject:(id)color.CGColor];
        }
    }
    return _colors;
}

- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    
    
    CGRect maskRect = [self.maskLayer frame];
    maskRect.size.width = CGRectGetWidth([self bounds]) * _progress;
    [self. maskLayer setFrame:maskRect];
}




+ (Class)layerClass{
    return [CAGradientLayer class];
}


@end
