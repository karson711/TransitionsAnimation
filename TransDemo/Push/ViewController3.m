//
//  ViewController3.m
//  TransDemo
//
//  Created by anfa on 2019/11/8.
//  Copyright © 2019 jaki. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@property(nonatomic,strong)UIPanGestureRecognizer * pan;

//系统提供了一个继承UIViewControllerInteractiveTransitioning的类，也实现了三个函数(与IntObject类功能相同)
@property(nonatomic,strong)UIPercentDrivenInteractiveTransition * obj;

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    [self.view addGestureRecognizer:self.pan];

}

-(void)pan:(UIPanGestureRecognizer *)pan{

    CGPoint translatedPoint = [pan translationInView:self.view];
    CGFloat persent =  translatedPoint.x /  [[UIScreen mainScreen]bounds].size.width;
    if (persent<0) {
        return;
    }
    persent = fabs(persent);
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:{
            [self.navigationController popViewControllerAnimated:YES];
            break;
        }
        case UIGestureRecognizerStateChanged:{
            //手势过程中，通过updateInteractiveTransition设置pop过程进行的百分比
            [self.obj updateInteractiveTransition:persent];
            NSLog(@"333");
            break;
        }
        case UIGestureRecognizerStateEnded:{
            //手势完成后结束标记并且判断移动距离是否过半，过则finishInteractiveTransition完成转场操作，否者取消转场操作
            if (persent > 0.5) {
                [self.obj finishInteractiveTransition];
            }else{
                [self.obj cancelInteractiveTransition];
            }
            break;
        }
            case UIGestureRecognizerStateCancelled:
        {
            [self.obj cancelInteractiveTransition];
        }
            break;
        default:
            break;
    }
}

-(UIPanGestureRecognizer *)pan{
    if (!_pan) {
        _pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    }
    return _pan;
}
@end
