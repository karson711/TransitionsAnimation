//
//  AniObject.m
//  TransDemo
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "AniObject.h"

@implementation AniObject

//这个函数用来设置动画执行时长
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 2;
}

//这个函数用来处理具体的动画
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    //跳转的界面
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //最终的位置
    CGRect finalRect = [transitionContext finalFrameForViewController:toVC];
    //起始位置
    toVC.view.frame = CGRectOffset(finalRect, [[UIScreen mainScreen]bounds].size.width,0);
    
    //添加到内容视图
    [[transitionContext containerView]addSubview:toVC.view];
    //执行动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext]  animations:^{
        toVC.view.frame = finalRect;
    } completion:^(BOOL finished) {
        //完成动画
        [transitionContext completeTransition:YES];
    }];
}

- (void)animationEnded:(BOOL) transitionCompleted{
    NSLog(@"动画结束");
}

@end
