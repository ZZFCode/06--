//
//  ZZFCollisionView.m
//  06-物理仿真动画框架
//
//  Created by 左忠飞 on 16/4/9.
//  Copyright © 2016年 zzf.con. All rights reserved.
//

#import "ZZFCollisionView.h"

@implementation ZZFCollisionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"加载边缘碰撞检测行为视图");
        
        //添加视图
        self.boxView.bounds = CGRectMake(0, 0, 20, 20);
        
        NSMutableArray *array = [NSMutableArray array];
        
        for (int i = 0; i<10; i++) {
            UIView *viewi = [self randView:i];
            [self addSubview:viewi];
            [array addObject:viewi];
        }
        [array addObject:self.boxView];

        //重力行为
        UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:array];
        [self.animator addBehavior:gravity];
        
        //边界检测
        UICollisionBehavior *collision = [[UICollisionBehavior alloc]initWithItems:array];
        
        collision.translatesReferenceBoundsIntoBoundary = YES;
        
        //设置代理
        collision.collisionDelegate = self;
        
        //添加一个红色的view
        UIView *red = [[UIView alloc]initWithFrame:CGRectMake(0, 250, 340, 10)];
        red.backgroundColor = [UIColor redColor];
        [self addSubview:red];
        
        //添加一个蓝色的view
        UIView *blue = [[UIView alloc]initWithFrame:CGRectMake(24, 380, 351, 10)];
        blue.backgroundColor = [UIColor blueColor];
        [self addSubview:blue];
        
        //添加一个绿色的view
        UIView *green = [[UIView alloc]initWithFrame:CGRectMake(0, 480, 351, 10)];
        green.backgroundColor = [UIColor greenColor];
        [self addSubview:green];
        
        
//        red.layer.affineTransform = CGAffineTransformMakeRotation(M_PI_4/3);
        
        //为红色视图添加点击事件
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
//        [red addGestureRecognizer:tap];
        
        
        
        //手动添加边界
        CGPoint formP = red.frame.origin;
        CGPoint top = CGPointMake(red.frame.size.width, formP.y);
        
        
        //添加红色边界
        [collision  addBoundaryWithIdentifier:@"redBoundary" fromPoint:formP toPoint:top];
        
        //添加蓝色边界
        [collision addBoundaryWithIdentifier:@"blueBoundary" fromPoint:CGPointMake(25, 380) toPoint:CGPointMake(375,380)];
        //添加绿色边界
        [collision addBoundaryWithIdentifier:@"greenBoundary" fromPoint:CGPointMake(0, 480) toPoint:CGPointMake(350,480)];
        
        [self.animator addBehavior:collision];
        
        //物体的属性行为
        UIDynamicItemBehavior *item = [[UIDynamicItemBehavior alloc]initWithItems:array];
        
        item.elasticity = 1.1;
        [self.animator addBehavior:item];
        
        
        
    }
    return self;
}


//创建随机位置,随机颜色的view
-(UIView *)randView:(int)i{
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(arc4random_uniform(375), arc4random_uniform(250)+66, 20, 20)];
    view1.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30, 20)];
    
    label.text = [NSString stringWithFormat:@"%d",i];
    
    [view1 addSubview:label];
    
    return view1;
}



//-(void)tapAction{
//    NSLog(@"kkdl;asdjf");
//}
@end
