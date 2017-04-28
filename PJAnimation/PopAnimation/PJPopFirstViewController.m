//
//  PJPopFirstViewController.m
//  PJAnimation
//
//  Created by Lu Yiwei on 17/3/31.
//  Copyright © 2017年 Smile. All rights reserved.
//

#import "PJPopFirstViewController.h"
#import "PJPopSecondViewController.h"
#import "UIViewController+PJFullscreenPopGesture.h"

@interface PJPopFirstViewController ()

@property (nonatomic, strong) UILabel *identifierLabel;
@property (nonatomic, strong) UIButton *pushButton;

@end

@implementation PJPopFirstViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self p_addSubviews];
    [self p_layoutSubviews];
    
    self.pj_transitionFinishedBlock = ^{
        NSLog(@"侧滑结束");
    };
}

#pragma mark - Action
- (void)pushButtonDidClicked:(UIButton *)button {
    
    [self.navigationController pushViewController:[[PJPopSecondViewController alloc] init]
                                         animated:YES];
}

#pragma mark - Private Method
- (void)p_addSubviews {
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.identifierLabel];
    [self.view addSubview:self.pushButton];
}

- (void)p_layoutSubviews {
    
    [self.identifierLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.right.equalTo(self.view);
        make.centerX.equalTo(self.view);
    }];
    
    [self.pushButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.identifierLabel.mas_bottom).offset(100);
        make.centerX.equalTo(self.view);
    }];
}

#pragma mark - Setter and Getter
- (UILabel *)identifierLabel {
    
    if (!_identifierLabel) {
        _identifierLabel = [[UILabel alloc] init];
        [_identifierLabel setText:@"FirstViewController"];
        [_identifierLabel setTextAlignment:NSTextAlignmentCenter];
        [_identifierLabel setFont:[UIFont systemFontOfSize:30]];
        [_identifierLabel setTextColor:[UIColor blueColor]];
        [_identifierLabel setNumberOfLines:0];
    }
    return _identifierLabel;
}

- (UIButton *)pushButton {
    
    if (!_pushButton) {
        _pushButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_pushButton setTitle:@"Push" forState:UIControlStateNormal];
        [_pushButton setTitle:@"Push" forState:UIControlStateHighlighted];
        [_pushButton.titleLabel setFont:[UIFont systemFontOfSize:30]];
        [_pushButton addTarget:self action:@selector(pushButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushButton;
}

@end
