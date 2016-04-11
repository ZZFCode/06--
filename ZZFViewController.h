//
//  ZZFViewController.h
//  06-物理仿真动画框架
//
//  Created by 左忠飞 on 16/4/9.
//  Copyright © 2016年 zzf.con. All rights reserved.
//

#import <UIKit/UIKit.h>


//定义一个表示不同的子控制器的的枚举类型
typedef enum{
    KDemoFunctionSnap,
    KDemoFunctionPush,
    KDemoFunctionAttachment,
    KDemoFunctionSpring,
    KDemoFunctionCollision
} KDemoFunction;


@interface ZZFViewController : UIViewController

//功能类型
@property(nonatomic,assign)KDemoFunction idx;

@end
