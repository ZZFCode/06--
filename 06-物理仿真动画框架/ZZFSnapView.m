//
//  ZZFSnapView.m
//  06-物理仿真动画框架
//
//  Created by 左忠飞 on 16/4/9.
//  Copyright © 2016年 zzf.con. All rights reserved.
//
/**
 物理仿真的基本过程
 1 仿真者
 2 仿真行为
 3 将仿真行为添加到仿真者
 */
#import "ZZFSnapView.h"

@implementation ZZFSnapView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"加载吸附视图");
        
        //点按手势识别器
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        //将点按手势添加到视图上
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

//点按手势监听的事件
-(void)tapAction:(UITapGestureRecognizer *)recognizer{
    //在添加行为之前移除所有的行为
    [self.animator removeAllBehaviors];
    //获取触摸点
    CGPoint loc = [recognizer locationInView:self];
    
    //创建吸附行为
    UISnapBehavior *snap = [[UISnapBehavior alloc]initWithItem:self.boxView snapToPoint:loc];
    
    //吸附行为的属性
    //对象的摇晃程度
    snap.damping = 0;
    //将吸附行为添加到行为管理者上
    [self.animator addBehavior:snap];
}

@end
