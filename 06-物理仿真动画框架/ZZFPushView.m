//
//  ZZFPushView.m
//  06-物理仿真动画框架
//
//  Created by 左忠飞 on 16/4/9.
//  Copyright © 2016年 zzf.con. All rights reserved.
//

#import "ZZFPushView.h"

@interface ZZFPushView ()

//开始图片的点
@property(nonatomic,strong)UIImageView *strateImgView;
//点移动过程中手指触摸的当前点
@property(nonatomic,assign)CGPoint currentPoint;

//推动行为
@property(nonatomic,strong)UIPushBehavior *push;
@end

@implementation ZZFPushView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        //创建蓝色的view
        UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 15, 15)];
        blueView.backgroundColor = [UIColor blueColor];
        [self addSubview:blueView];
        NSLog(@"加载推动视图");
        //创建拖拽手势识别器
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
        //把手势识别器添加到当前界面上
        [self addGestureRecognizer:pan];
        
        self.boxView.bounds = CGRectMake(0, 0, 30, 30);
        
        //添加推动行为
        UIPushBehavior *push = [[UIPushBehavior alloc]initWithItems:@[self.boxView] mode:UIPushBehaviorModeInstantaneous];
        
        //添加到仿真行为管理者
        [self.animator addBehavior:push];
        
        //赋值
        self.push = push;
        
        //碰撞行为检测
        UICollisionBehavior *collision = [[UICollisionBehavior alloc]initWithItems:@[self.boxView,blueView]];
        collision.translatesReferenceBoundsIntoBoundary = YES;
        
        
        UIDynamicItemBehavior *item = [[UIDynamicItemBehavior alloc]initWithItems:@[self.boxView]];
        
        item.elasticity = 0.9;
        [self.animator addBehavior:item];

        
        [self.animator addBehavior:collision];
    }
    return self;
}

//拖拽手势识别器的监听得方法
-(void)panAction:(UIPanGestureRecognizer *)recognizer{
    //根据不同的状态执行不同的操作
    //获取用户手势的触摸点
    CGPoint loc = [recognizer locationInView:self];
    
    //判断拖拽的不同状态
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        NSLog(@"开始拖拽了");
        //显示图片,放置到触摸的店
        self.strateImgView.hidden = NO;
        self.strateImgView.center = loc;
        self.currentPoint = loc;
        
    }
    
    
    else if (recognizer.state == UIGestureRecognizerStateChanged){
        NSLog(@"正在拖拽中");
        //保存当前的点
        self.currentPoint = loc;
        
        //绘制图形
        [self setNeedsDisplay];
    }
    
    else if (recognizer.state == UIGestureRecognizerStateEnded){
        NSLog(@"拖拽结束了");
        
        
        
        
        //拖拽结束了,隐藏其实图片
        self.strateImgView.hidden = YES;
        
        
        //计算拖动的偏移量
        CGPoint offset = CGPointMake(self.strateImgView.center.x - loc.x, self.strateImgView.center.y - loc.y);
        //计算距离
        CGFloat distance = hypotf(offset.x, offset.y);
        
        //计算角度
        CGFloat angle = atan2(offset.y, offset.x);
        
        //设置推动行为的属性
        self.push.magnitude = distance;
        self.push.angle = angle;
        
        //让单次推动生效
        self.push.active = YES;
        
        
        //清除线条
        //将图片以及当前的店放置到0,0
        self.strateImgView.center = CGPointZero;
        self.currentPoint = self.strateImgView.center;
        
        //重新绘制图形
        [self setNeedsDisplay];
    }
}

//绘图方法
-(void)drawRect:(CGRect)rect{
    //创建一个路径对象
    UIBezierPath *path = [UIBezierPath bezierPath];
    //设置起点
    [path moveToPoint:self.strateImgView.center];
    //设置终点
    [path addLineToPoint:self.currentPoint];
    //设置线宽度,颜色
    [path setLineWidth:10];
    [[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:0.7]setStroke];
    [path setLineCapStyle:kCGLineCapRound];
    
    //渲染
    [path stroke];
}

//图片的懒加载
-(UIImageView *)strateImgView{
    if (_strateImgView == nil) {
        _strateImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"AttachmentPoint_Mask"]];
        
        //默认隐藏
        _strateImgView.hidden = YES;
        
        //添加到当前视图中
        [self addSubview:_strateImgView];
    }
    return _strateImgView;
}

@end
