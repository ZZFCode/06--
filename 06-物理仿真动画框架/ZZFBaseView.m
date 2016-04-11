//
//  ZZFBaseView.m
//  06-物理仿真动画框架
//
//  Created by 左忠飞 on 16/4/9.
//  Copyright © 2016年 zzf.con. All rights reserved.
//

#import "ZZFBaseView.h"

@implementation ZZFBaseView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        //设置背景
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundTile"]];
        //方框
        UIImageView *boxView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Box1"]];
        //调整中心店
        boxView.center = CGPointMake(self.center.x, 150);
        //添加到view
        [self addSubview:boxView];
        //赋值
        self.boxView = boxView;
        
        //创建仿真行为管理者
        UIDynamicAnimator *animator = [[UIDynamicAnimator alloc]initWithReferenceView:self];
        //赋值
        self.animator = animator;
    }
    //返回
    return self;
}


@end
