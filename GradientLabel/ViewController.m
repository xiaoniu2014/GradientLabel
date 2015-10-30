//
//  ViewController.m
//  GradientLabel
//
//  Created by hw on 15/10/30.
//  Copyright © 2015年 hongw. All rights reserved.
//

#import "ViewController.h"
#import "HWGradientLabel.h"
#import "HWProgressView.h"
#import "HWCircleView.h"

#import "MBProgressHUD.h"

@interface ViewController ()

@property (nonatomic,strong) HWProgressView *progressView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    HWProgressView *progressView = [[HWProgressView alloc] initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.view.bounds), 3)];
    [self.view addSubview:progressView];
    [progressView performAnimation];
    self.progressView = progressView;
    
    self.progressView.progress = 1;
    
    HWGradientLabel *gradientLabel = [[HWGradientLabel alloc] initWithFrame:CGRectMake(20, 100, 300, 60)];
    gradientLabel.backgroundColor = [UIColor clearColor];
    gradientLabel.text = @"上海欢迎你!!";
    gradientLabel.fontSize = 20;
    [self.view addSubview:gradientLabel];
    [gradientLabel performAnimation];
    
    
    
    
    
    
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
}
- (IBAction)buttonClick:(UIButton *)sender {
    
    [HWCircleView showAnimationWithSuperView:self.view];
}

- (IBAction)SliderValueChanged:(UISlider *)sender {
    self.progressView.progress = sender.value;
}





@end
