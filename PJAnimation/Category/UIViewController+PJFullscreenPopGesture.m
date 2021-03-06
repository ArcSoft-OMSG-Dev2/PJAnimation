//
//  UIViewController+PJFullscreenPopGesture.m
//  AOF
//
//  Created by Lu Yiwei on 16/7/6.
//
//

#import "UIViewController+PJFullscreenPopGesture.h"
#import <objc/runtime.h>

@implementation UIViewController (PJFullscreenPopGesture)

- (BOOL)pj_interactivePopEnabled {
    
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setPj_interactivePopEnabled:(BOOL)pj_interactivePopEnabled{
    
    objc_setAssociatedObject(self,
                             @selector(pj_interactivePopEnabled),
                             @(pj_interactivePopEnabled),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (PJTransitionFinishedBlock)pj_transitionFinishedBlock{
    
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setPj_transitionFinishedBlock:(PJTransitionFinishedBlock)transitionFinishedBlock {
    
    objc_setAssociatedObject(self,
                             @selector(pj_transitionFinishedBlock),
                             transitionFinishedBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
