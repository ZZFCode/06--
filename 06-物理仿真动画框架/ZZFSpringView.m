//
//  ZZFSpringView.m
//  06-物理仿真动画框架
//
//  Created by 左忠飞 on 16/4/9.
//  Copyright © 2016年 zzf.con. All rights reserved.
//

#import "ZZFSpringView.h"

@interface ZZFSpringView ()

@property(nonatomic,strong)UIGestureRecognizer *spring;

@end

@implementation ZZFSpringView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"加载弹性附着视图");
        
        //振幅
        self.attachment.damping = 1.0f;
        self.attachment.frequency = 1.0;
        
        UIView *red = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 20, 20)];
        red.backgroundColor = [UIColor redColor];
        [self addSubview:red];
        UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:@[self.boxView]];
        
        [self.animator addBehavior:gravity];
        
        [self.boxView addObserver:self forKeyPath:@"center" options:NSKeyValueObservingOptionNew context:nil];
    
        //添加碰撞行为
        UICollisionBehavior *collision = [[UICollisionBehavior alloc]initWithItems:@[red]];
        collision.translatesReferenceBoundsIntoBoundary=YES;
        [self.animator addBehavior:collision];
        
        
    }
    return self;
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    [self setNeedsDisplay];
}

-(void)dealloc{
    [self.boxView removeObserver:self forKeyPath:@"center"];
}
@end
