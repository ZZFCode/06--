//
//  ZZFViewController.m
//  06-物理仿真动画框架
//
//  Created by 左忠飞 on 16/4/9.
//  Copyright © 2016年 zzf.con. All rights reserved.
//

#import "ZZFViewController.h"
#import "ZZFBaseView.h"
#import "ZZFSnapView.h"
#import "ZZFPushView.h"
#import "ZZFAttachmentView.h"
#import "ZZFSpringView.h"
#import "ZZFCollisionView.h"

@interface ZZFViewController ()

@end

@implementation ZZFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //定义一个视图的变量
    ZZFBaseView *baseView;
    
    //根据传进来的值进行判断要进入哪一个视图
    switch (self.idx) {
        case KDemoFunctionSnap:
            baseView = [[ZZFSnapView alloc]initWithFrame:self.view.bounds];
            break;
        case KDemoFunctionPush:
            baseView = [[ZZFPushView alloc]initWithFrame:self.view.bounds];
            break;
        case KDemoFunctionAttachment:
            baseView = [[ZZFAttachmentView alloc]initWithFrame:self.view.bounds];
            break;
        case KDemoFunctionCollision:
            baseView = [[ZZFCollisionView alloc]initWithFrame:self.view.bounds];
            break;
        case KDemoFunctionSpring:
            baseView = [[ZZFSpringView alloc]initWithFrame:self.view.bounds];
            break;
            
            
        default:
            break;
    }
    
    //添加
    [self.view addSubview:baseView];

}



@end
