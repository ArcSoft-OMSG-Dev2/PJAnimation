//
//  PJZoomAnimation.m
//  PJAnimation
//
//  Created by Lu Yiwei on 17/3/31.
//  Copyright © 2017年 Smile. All rights reserved.
//

#import "PJZoomAnimation.h"
#import "PJZoomAnimationProtocol.h"

@interface PJZoomAnimation () 

@end

@implementation PJZoomAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.75f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController<PJZoomAnimationProtocol> *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController<PJZoomAnimationProtocol> *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];

    UIView *fromAnimationView = [fromViewController viewForAnimation];
    UIView *toAnimationView = [toViewController viewForAnimation];

    UIView *transitionView = [[UIImageView alloc] initWithImage:[self imageFromView:fromAnimationView]];
    transitionView.frame = [fromAnimationView convertRect:fromAnimationView.bounds toView:containerView];
    
    __block UIView *fromViewSnapshotView;
    __block UIView *toViewSnapshotView;
    
    dispatch_group_t group = dispatch_group_create();

    dispatch_group_async(group, dispatch_get_main_queue(), ^{
        fromAnimationView.hidden = YES;
        fromViewSnapshotView = [[UIImageView alloc] initWithImage:[self imageFromView:fromViewController.view]];
    });
    
    dispatch_group_async(group, dispatch_get_main_queue(), ^{
        toAnimationView.hidden = YES;
        toViewSnapshotView = [[UIImageView alloc] initWithImage:[self imageFromView:toViewController.view]];
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        UIView *transitionContainer = [[UIView alloc] initWithFrame:containerView.bounds];
        transitionContainer.opaque = YES;
        
        [containerView addSubview:toViewController.view];
        [containerView addSubview:transitionContainer];
        
        [transitionContainer addSubview:toViewSnapshotView];
        [transitionContainer addSubview:fromViewSnapshotView];
        [transitionContainer addSubview:transitionView];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            transitionView.frame = [toAnimationView convertRect:toAnimationView.bounds toView:containerView];
            fromViewSnapshotView.alpha = 0.0;
        } completion:^(BOOL finished) {
            fromAnimationView.hidden = NO;
            toAnimationView.hidden = NO;
            
            [transitionContainer removeFromSuperview];
            [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        }];
    });
}

#pragma mark - Private Method
- (UIImage *)imageFromView:(UIView *)view {
    
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 2.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
