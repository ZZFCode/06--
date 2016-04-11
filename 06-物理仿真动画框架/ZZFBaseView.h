//
//  ZZFBaseView.h
//  06-物理仿真动画框架
//
//  Created by 左忠飞 on 16/4/9.
//  Copyright © 2016年 zzf.con. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZFBaseView : UIView

//可以添加行为的图片框
@property(nonatomic,weak)UIImageView *boxView;

//仿真行为管理者
@property(nonatomic,strong)UIDynamicAnimator *animator;
@end
