//
//  PJZoomSecondViewController.m
//  PJAnimation
//
//  Created by Lu Yiwei on 17/3/31.
//  Copyright © 2017年 Smile. All rights reserved.
//

#import "PJZoomSecondViewController.h"

@interface PJZoomSecondViewController ()

@property (nonatomic, strong) UIImageView *animationView;
@property (nonatomic, strong) UIButton *popButton;

@end

@implementation PJZoomSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self p_addSubviews];
    [self p_layoutSubviews];
}

- (void)popButtonDidClicked:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - PJZoomAnimationProtocol
- (UIView *)viewForAnimation {
    
    return self.animationView;
}

#pragma mark - Private Method
- (void)p_addSubviews {
    
    [self.view setBackgroundColor:[UIColor whiteColor]];

    [self.view addSubview:self.animationView];
}

- (void)p_layoutSubviews {
    
    [self.animationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
}

#pragma mark - Setter and Getter
- (UIImageView *)animationView {
    
    if (!_animationView) {
        _animationView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zoomPicture"]];
    }
    return _animationView;
}

@end
