//
//  HWGradientLabel.h
//  GradientLabel
//
//  Created by hw on 15/10/30.
//  Copyright © 2015年 hongw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWGradientLabel : UIView

@property (nonatomic ,copy) NSString *text;

@property (nonatomic ,assign) CGFloat fontSize;

- (void)performAnimation;

@end
