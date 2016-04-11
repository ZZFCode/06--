//
//  ZZFAttachmentView.m
//  06-物理仿真动画框架
//
//  Created by 左忠飞 on 16/4/9.
//  Copyright © 2016年 zzf.con. All rights reserved.
//

#import "ZZFAttachmentView.h"

@interface ZZFAttachmentView ()

{
    UIImageView *_anchorImgView;
    UIImageView *_offsetImgView;
    
}

@end

@implementation ZZFAttachmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"加载刚性附着视图");
        
        //实例化刚性附着行为
        //距离中心店便宜距离
        UIOffset offset = UIOffsetMake(20, 20);
        
        //附着点
        CGPoint anchorPoint = CGPointMake(self.boxView.center.x, 300);
        
        //创建附着行为
        UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc]initWithItem:self.boxView offsetFromCenter:offset attachedToAnchor:anchorPoint];
        
        [self.animator addBehavior:attachment];
        
        _attachment = attachment;
        
        //添加图
        UIImage *img = [UIImage imageNamed:@"AttachmentPoint_Mask"];
        
        //附着点的图片框
        UIImageView *anchorImgView = [[UIImageView alloc]initWithImage:img];
        anchorImgView.center = anchorPoint;
        
        [self addSubview:anchorImgView];
        _anchorImgView = anchorImgView;
        
        //参考点图片框
        UIImageView *offsetImgView = [[UIImageView alloc]initWithImage:img];
        offsetImgView.center = CGPointMake(self.boxView.bounds.size.width*0.8, self.boxView.bounds.size.height*0.8);
        _offsetImgView = offsetImgView;
        [self.boxView addSubview:offsetImgView];
        
        //添加手势
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
        
        [self addGestureRecognizer:pan];
        
        
    }
    return self;
}

-(void)panAction:(UIPanGestureRecognizer *)pan{
    if (pan.state == UIGestureRecognizerStateBegan) {
        //获取触摸点
        CGPoint loc = [pan locationInView:self];
        
        //修改附着行为的附着点
        _attachment.anchorPoint = loc;
        _anchorImgView.center = loc;
        
        [self setNeedsDisplay];
    }else if (pan.state == UIGestureRecognizerStateChanged){
        CGPoint loc = [pan locationInView:self];
        //修改附着行为的附着点
        _attachment.anchorPoint = loc;
        _anchorImgView.center = loc;
        
        [self setNeedsDisplay];
    }
}

-(void)drawRect:(CGRect)rect{
    CGPoint p1 = _anchorImgView.center;
    CGPoint p2 = [self convertPoint:_offsetImgView.center fromView:self.boxView];
    
    //路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 10;
//    path.lineCapStyle = ;
    [path moveToPoint:p1];
    [path addLineToPoint:p2];
    
    [path stroke];
}

@end
