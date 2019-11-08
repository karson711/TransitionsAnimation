//
//  ViewController2.m
//  TransDemo
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "ViewController2.h"
#import "IntObject.h"

@interface ViewController2 ()

@property(nonatomic,strong)UIPanGestureRecognizer * pan;

@property(nonatomic,strong)IntObject * obj;

@end

@implementation ViewController2

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
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
        }
        case UIGestureRecognizerStateChanged:{
            //手势过程中，通过updateInteractiveTransition设置pop过程进行的百分比
            [self.obj updateAniProgress:persent];
            NSLog(@"333");
            break;
        }
        case UIGestureRecognizerStateEnded:{
            //手势完成后结束标记并且判断移动距离是否过半，过则finishInteractiveTransition完成转场操作，否者取消转场操作
            if (persent > 0.5) {
                [self.obj finish];
            }else{
                [self.obj cancel];
            }
            break;
        }
            case UIGestureRecognizerStateCancelled:
        {
            [self.obj cancel];
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
