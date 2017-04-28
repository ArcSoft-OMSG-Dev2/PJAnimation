//
//  PJPopAnimation.m
//  AOF
//
//  Created by Lu Yiwei on 16/7/5.
//
//

#import "PJPopAnimation.h"

@interface PJPopAnimation () 

@property (nonatomic, strong) id <UIViewControllerContextTransitioning> transitionContext;

@end

@implementation PJPopAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.3;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    // 1
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2
    UIView *fromView;
    UIView *toView;
    
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        fromView = fromViewController.view;
        toView = toViewController.view;
    }
    
    // 3
    fromView.frame = [transitionContext initialFrameForViewController:fromViewController];
    toView.frame = [transitionContext finalFrameForViewController:toViewController];
    
    // 4
    UIView *containerView = [transitionContext containerView];

    // 5
    [containerView insertSubview:toView belowSubview:fromView];
    
    // 6
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
    } completion:^(BOOL finished) {
        fromView.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

@end

