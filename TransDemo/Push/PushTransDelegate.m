//
//  PushTransDelegate.m
//  TransDemo
//
//  Created by anfa on 2019/11/8.
//  Copyright © 2019 jaki. All rights reserved.
//

#import "PushTransDelegate.h"

@implementation PushTransDelegate

/*-------------------UINavigationControllerDelegate-------------------*/
//设置转场动画不论是push或者pop返回nil，都使用系统默认的导航转场动画
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController{
    NSLog(@"aaa");
    return nil;
}

//设置可交互的转场动画
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  {
    NSLog(@"sss");
    return nil;
}


@end
