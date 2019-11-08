//
//  IntObject.m
//  TransDemo
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "IntObject.h"


@interface IntObject()

@property(nonatomic,strong)id<UIViewControllerContextTransitioning> context;

@end

@implementation IntObject

//这个函数用来保存transitionContext
-(void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    self.context = transitionContext;
    //跳转的界面
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController * fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //最终的位置
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    //添加到内容视图
    [[transitionContext containerView]insertSubview:toVC.view belowSubview:fromVC.view];
}

//更新动画状态
-(void)updateAniProgress:(CGFloat)progress{
    UIView *frameVC = [self.context viewForKey:UITransitionContextFromViewKey];
    //最终的位置
    CGRect fR = CGRectMake( [UIScreen mainScreen].bounds.size.width*progress, 0, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height);
    frameVC.frame = fR;
    [self.context updateInteractiveTransition:progress];
}

//结束转场
-(void)finish{
    [UIView animateWithDuration:0.2 animations:^{
        UIView *frameVC = [self.context viewForKey:UITransitionContextFromViewKey];
        frameVC.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    } completion:^(BOOL finished) {
      [self.context finishInteractiveTransition];
        [self.context completeTransition:YES];
    }];
}

//取消转场
-(void)cancel{
    [UIView animateWithDuration:0.2 animations:^{
        UIView *frameVC = [self.context viewForKey:UITransitionContextFromViewKey];
        frameVC.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    } completion:^(BOOL finished) {
        [self.context cancelInteractiveTransition];
        [self.context completeTransition:NO];
    }];
}

@end
