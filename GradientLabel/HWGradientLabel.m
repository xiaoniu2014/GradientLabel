//
//  HWGradientLabel.m
//  GradientLabel
//
//  Created by hw on 15/10/30.
//  Copyright © 2015年 hongw. All rights reserved.
//

#import "HWGradientLabel.h"

@interface HWGradientLabel()

@property (nonatomic,strong) CATextLayer    *textLayer;
@property (nonatomic,strong) CAGradientLayer *gradientLayer;

@property (nonatomic,strong) NSMutableArray *colors;

@end

@implementation HWGradientLabel


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.gradientLayer.colors = self.colors;
        
        self.gradientLayer.mask = self.textLayer;
        
    }
    return self;
}

- (void)setText:(NSString *)text{
    _text = [text copy];
    self.textLayer.string = text;
    
}

- (void)setFontSize:(CGFloat)fontSize{
    _fontSize = fontSize;
    self.textLayer.fontSize = fontSize;
}

- (void)performAnimation{
    id lastObject = [self.colors lastObject];
    [self.colors removeLastObject];
    [self.colors insertObject:lastObject atIndex:0];
    
    self.gradientLayer.colors = self.colors;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"colors"];
    animation.duration = 0.01;
    animation.toValue = self.colors;
    animation.delegate = self;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBackwards;
    [self.gradientLayer addAnimation:animation forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self performAnimation];
}


- (NSMutableArray *)colors{
    if (!_colors) {
        _colors = [[NSMutableArray alloc] initWithCapacity:255];
        for (int i = 0; i < 255; i+=5) {
            UIColor *color = [UIColor colorWithHue:i / 255.0f
                                        saturation:1.0
                                        brightness:1.0
                                             alpha:1.0];
            
//            color = [[UIColor blackColor] colorWithAlphaComponent:i/255.0f];
            [_colors addObject:(id)[color CGColor]];
        }
    }
    return _colors;
}
- (CATextLayer *)textLayer{
    if (!_textLayer) {
        _textLayer = [CATextLayer layer];
        _textLayer.frame = self.bounds;
        _textLayer.alignmentMode = kCAAlignmentCenter;
        _textLayer.wrapped = YES;
    }
    return _textLayer;
}

- (CAGradientLayer *)gradientLayer{
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.frame = self.bounds;
        _gradientLayer.startPoint = CGPointMake(0, 0.5);
        _gradientLayer.endPoint = CGPointMake(1, 0.5);
        [self.layer addSublayer:_gradientLayer];
    }
    return _gradientLayer;
}

@end
