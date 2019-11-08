//
//  TransDelegate.m
//  TransDemo
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "TransDelegate.h"
#import "AniObject.h"

@implementation TransDelegate

-(instancetype)init{
    self = [super init];
    if (self) {
        self.object = [IntObject new];
    }
    return self;
}

//UIViewControllerAnimatedTransitioning：具体的动画效果
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [AniObject new];
}

//UIViewControllerInteractiveTransitioning：处理可交互的转场动画的具体表现
- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    //遵守了UIViewControllerAnimatedTransitioning协议的对象
    return self.object;
}



@end
