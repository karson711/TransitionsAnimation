//
//  TransDelegate.h
//  TransDemo
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IntObject.h"

@interface TransDelegate : NSObject<UIViewControllerTransitioningDelegate>

@property(nonatomic,strong)IntObject *object;

@end
