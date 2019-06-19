//
//  ViewController.m
//  CartonDetectionTool
//
//  Created by ADMIN on 2019/6/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

#import "ViewController.h"
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface ViewController ()
{
    UIButton *_scBtn;//screenCapture Button
    UIButton *_spBtn;//startPush Button
    RPSystemBroadcastPickerView *_broadPickerView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _broadPickerView = [[RPSystemBroadcastPickerView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, SCREEN_HEIGHT/2-75 , 1, 1)];
    _broadPickerView.preferredExtension = @"com.hdu.CartonDetectionTool.ScreenCapture";
    [self.view addSubview: _broadPickerView];
    
    //创建按钮
    _scBtn = [[UIButton alloc] init];
    _spBtn = [[UIButton alloc] init];
    //设置文字
    [_scBtn setTitle:@"开启录屏" forState:UIControlStateNormal];
    [_spBtn setTitle:@"开始推送" forState:UIControlStateNormal];
    //设置按钮背景颜色
    [_scBtn setBackgroundColor:UIColor.orangeColor];
    [_spBtn setBackgroundColor:UIColor.orangeColor];
    //设置按钮位置
    _scBtn.frame = CGRectMake(SCREEN_WIDTH/2-50, SCREEN_HEIGHT/2-75 , 100, 50);
    _spBtn.frame = CGRectMake(SCREEN_WIDTH/2-50, SCREEN_HEIGHT/2+25 , 100, 50);
    //绑定点击事件
    [_scBtn addTarget:self action:@selector(clickedOnStartRecordButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_scBtn];
    [self.view addSubview:_spBtn];
    

}


-(void)clickedOnStartRecordButton:(UIButton *)sender{
    for (UIView *view in _broadPickerView.subviews){
        if([view isKindOfClass:[UIButton class]]){
            [(UIButton*)view sendActionsForControlEvents:UIControlEventTouchDown];
        }
    }
}

@end
