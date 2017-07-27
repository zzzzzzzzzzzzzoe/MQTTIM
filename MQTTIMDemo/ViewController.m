//
//  ViewController.m
//  MQTTIMDemo
//
//  Created by mac on 2017/6/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewController.h"
#import "MQTTManager.h"
@interface ViewController ()
@property (nonatomic,strong) UIButton * lianjieBtn , * dislianjieBtn , * sentBtn;
@property (nonatomic,strong) UITextField * inputTF;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    _sentBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 50)];
    [_sentBtn setBackgroundColor:[UIColor redColor]];
    [_sentBtn setTitle:@"fasong" forState:UIControlStateNormal];
    [_sentBtn addTarget:self action:@selector(sendAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_sentBtn];
    
    _lianjieBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 50)];
    [_lianjieBtn setBackgroundColor:[UIColor redColor]];
    [_lianjieBtn setTitle:@"连接" forState:UIControlStateNormal];
    [_lianjieBtn addTarget:self action:@selector(ljclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_lianjieBtn];
    
    _dislianjieBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    [_dislianjieBtn setBackgroundColor:[UIColor redColor]];
    [_dislianjieBtn setTitle:@"bu连接" forState:UIControlStateNormal];
    [_dislianjieBtn addTarget:self action:@selector(disljclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_dislianjieBtn];
    
    _inputTF = [[UITextField alloc]initWithFrame:CGRectMake(100, 400, 100, 50)];
    _inputTF.backgroundColor = [UIColor redColor];
    [self.view addSubview:_inputTF];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)ljclick{
    //    [[IMSocketManager share] connect];
    [[MQTTManager share] connect];
    
}

- (void)disljclick{
    //    [[IMSocketManager share] disConnect];
    [[MQTTManager share] disConnect];
    
    
}

//发送消息
- (void)sendAction
{
    if (_inputTF.text.length == 0) {
        return;
    }
    //    [[IMSocketManager share]sendMsg:_inputTF.text];
    [[MQTTManager share]sendMsg:_inputTF.text];
    
}

@end
