//
//  ViewController.m
//  06-物理仿真动画框架
//
//  Created by 左忠飞 on 16/4/9.
//  Copyright © 2016年 zzf.con. All rights reserved.
//

#import "ViewController.h"
#import "ZZFViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.array = @[@"吸附行为",@"推动行为",@"刚性附着行为",@"弹性附着行为",@"边缘碰撞检测行为"];
    
    

}

//MARK - 数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}
//返回cell的内容
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    //创建cell
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    //设置数据
    cell.textLabel.text = self.array[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //返回cell
    return cell;
    
}


//代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    //创建控制器
    ZZFViewController *zzfVc = [[ZZFViewController alloc]init];
    
    //传递选中
    zzfVc.idx = (int)indexPath.row;
    
    //跳转
    [self.navigationController pushViewController:zzfVc animated:YES ];
    
    //设置标题
    zzfVc.navigationItem.title = self.array[indexPath.row];
}



@end
