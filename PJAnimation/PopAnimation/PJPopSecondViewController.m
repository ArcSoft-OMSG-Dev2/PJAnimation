//
//  PJPopSecondViewController.m
//  PJAnimation
//
//  Created by Lu Yiwei on 17/3/31.
//  Copyright © 2017年 Smile. All rights reserved.
//

#import "PJPopSecondViewController.h"
#import "UIViewController+PJFullscreenPopGesture.h"

@interface PJPopSecondViewController ()

@property (nonatomic, strong) UILabel *identifierLabel;

@end

@implementation PJPopSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pj_interactivePopEnabled = YES;
    
    [self p_addSubviews];
    [self p_layoutSubviews];
}

#pragma mark - Private Method
- (void)p_addSubviews {
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.identifierLabel];
}

- (void)p_layoutSubviews {
    
    [self.identifierLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.right.equalTo(self.view);
        make.centerX.equalTo(self.view);
    }];
}

#pragma mark - Setter and Getter
- (UILabel *)identifierLabel {
    
    if (!_identifierLabel) {
        _identifierLabel = [[UILabel alloc] init];
        [_identifierLabel setText:@"SecondViewController"];
        [_identifierLabel setTextAlignment:NSTextAlignmentCenter];
        [_identifierLabel setFont:[UIFont systemFontOfSize:30]];
        [_identifierLabel setTextColor:[UIColor blueColor]];
        [_identifierLabel setNumberOfLines:0];
    }
    return _identifierLabel;
}

@end
