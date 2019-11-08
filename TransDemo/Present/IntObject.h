//
//  IntObject.h
//  TransDemo
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import <UIKit/UIKit.h>

//UIViewControllerInteractiveTransitioning：处理可交互的转场动画的具体表现
@interface IntObject : NSObject<UIViewControllerInteractiveTransitioning>

-(void)updateAniProgress:(CGFloat)progress;

-(void)finish;

-(void)cancel;

@end
