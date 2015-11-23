//
//  UISingleRotationGestureRecognizer.m
//  RotationView
//
//  Created by Luo_Pengfei on 15/10/24.
//  Copyright © 2015年 骆朋飞. All rights reserved.
//

#import "UISingleRotationGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>
/*
 单手实现视图的旋转功能。
 apple提供了UIRotationGestureRecognizer可供用户实现双手旋转视图的效果，这里利用toch

 
 */
@implementation UISingleRotationGestureRecognizer

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 判断手势数目
    if ([[event touchesForGestureRecognizer:self]count] > 1) {
        [self setState:UIGestureRecognizerStateFailed];
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.state == UIGestureRecognizerStatePossible) {
        [self setState:UIGestureRecognizerStateBegan];
    } else {
        [self setState:UIGestureRecognizerStateChanged];
    }
    UITouch *touch = [touches anyObject];
    // 获取手势作用视图
    UIView *view = [self view];
    CGPoint center = CGPointMake(CGRectGetMidX(view.bounds), CGRectGetMidY(view.bounds));
    // 获取当前作用手势位置
    CGPoint currentPoint = [touch locationInView:view];
    // 获取之前手势作用位置
    CGPoint previousPoint = [touch previousLocationInView:view];
    
    // 计算x和y差,然后利用tan反函数计算当前角度和手势作用之前角度
    CGFloat currentRotation = atan2f((currentPoint.y - center.y), (currentPoint.x - center.x));
    CGFloat previousRotation = atan2f((previousPoint.y - center.y), (previousPoint.x - center.x));
    
    // 得出前后手势作用旋转角度
    [self setRotation:(currentRotation - previousRotation)];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.state == UIGestureRecognizerStateChanged) {
        [self setState:UIGestureRecognizerStateEnded];
    }else {
        [self setState:UIGestureRecognizerStateFailed];
    }
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setState:UIGestureRecognizerStateFailed];
}


@end
