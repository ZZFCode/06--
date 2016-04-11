//
//  ZZFCollisionView.h
//  06-物理仿真动画框架
//
//  Created by 左忠飞 on 16/4/9.
//  Copyright © 2016年 zzf.con. All rights reserved.
//

#import "ZZFBaseView.h"

@interface ZZFCollisionView : ZZFBaseView<UICollisionBehaviorDelegate>

@property(nonatomic,strong)NSArray *array;

@property(nonatomic,strong)UIPushBehavior *push
;

@property(nonatomic,assign)CGPoint startPoint;

@end
