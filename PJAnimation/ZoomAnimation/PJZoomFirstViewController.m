//
//  PJZoomFirstViewController.m
//  PJAnimation
//
//  Created by Lu Yiwei on 17/3/31.
//  Copyright © 2017年 Smile. All rights reserved.
//

#import "PJZoomFirstViewController.h"
#import "PJZoomSecondViewController.h"

@interface PJZoomFirstViewController ()

@property (nonatomic, strong) UIImageView *animationView;
@property (nonatomic, strong) UIButton *pushButton;

@end

@implementation PJZoomFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self p_addSubviews];
    [self p_layoutSubviews];
}

#pragma mark - Action
- (void)pushButtonDidClicked:(UIButton *)button {
    
    [self.navigationController pushViewController:[[PJZoomSecondViewController alloc] init]
                                         animated:YES];
}

#pragma mark - PJZoomAnimationProtocol
- (UIView *)viewForAnimation {
    
    return self.animationView;
}

#pragma mark - Private Method 
- (void)p_addSubviews {
    
    [self.view setBackgroundColor:[UIColor whiteColor]];

    [self.view addSubview:self.animationView];
    [self.view addSubview:self.pushButton];
}

- (void)p_layoutSubviews {
    
    [self.animationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [self.pushButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.animationView.mas_bottom).offset(50);
        make.centerX.equalTo(self.view);
    }];
}

#pragma mark - Setter and Getter 
- (UIImageView *)animationView {
    
    if (!_animationView) {
        _animationView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zoomPicture"]];
    }
    return _animationView;
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
