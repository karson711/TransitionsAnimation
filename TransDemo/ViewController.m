//
//  ViewController.m
//  TransDemo
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "TransDelegate.h"
#import "PushTransDelegate.h"

@interface ViewController ()

@property(nonatomic,strong)TransDelegate * transDelegate;
@property(nonatomic,strong)PushTransDelegate * pushTransDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton * l = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    [l setTitle:@"present" forState:UIControlStateNormal];
    [l setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [l addTarget:self action:@selector(pres) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:l];
    
    UIButton * l2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 30)];
    [l2 setTitle:@"push" forState:UIControlStateNormal];
    [l2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [l2 addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:l2];
    
}

-(void)pres{
    ViewController2 * v2 = [ViewController2 new];
//    self.transDelegate = [[TransDelegate alloc]init];
//    v2.transitioningDelegate = self.transDelegate;
    [self.navigationController presentViewController:v2 animated:YES completion:nil];
}

-(void)push{
    ViewController3 * v3 = [ViewController3 new];
    self.pushTransDelegate = [[PushTransDelegate alloc]init];
    self.navigationController.delegate = self.pushTransDelegate;
    [self.navigationController pushViewController:v3 animated:YES];
}

@end
