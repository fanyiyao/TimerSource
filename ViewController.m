//
//  ViewController.m
//  timerSource
//
//  Created by xtmac02 on 14-10-17.
//  Copyright (c) 2014年 xtmac02. All rights reserved.
//

#import "ViewController.h"
#import "TimerDispatchSource.h"

@interface ViewController ()
@end
@implementation ViewController{
    TimerDispatchSource *_timer;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dispatch_block_t block=^{
        NSLog(@"hello world");
    };
    
    _timer=[[TimerDispatchSource alloc]initWithQueue:dispatch_get_main_queue() andTaskBlcok:block andInterval:1 andDelta:1 andLeeway:0];

    //恢复时间数据源按钮
    UIButton *btnResume=[[UIButton alloc]initWithFrame:CGRectMake(0, 100, 100, 40)];
    [btnResume setTitle:@"resume" forState:UIControlStateNormal];
    [btnResume addTarget:self action:@selector(btnResumeClick:) forControlEvents:UIControlEventTouchUpInside];
    btnResume.backgroundColor=[UIColor brownColor];
    [self.view addSubview:btnResume];
    
    
    UIButton *btnSuppend=[[UIButton alloc]initWithFrame:CGRectMake(200, 100, 100, 40)];
    btnSuppend.backgroundColor=[UIColor brownColor];
    [btnSuppend setTitle:@"suppend" forState:UIControlStateNormal];
    [btnSuppend addTarget:self action:@selector(suppendTimerClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSuppend];
    
    
}

#pragma mark 
#pragma mark 按钮事件

-(void)btnResumeClick:(UIButton *)sender{
    [_timer resumeTimerSource];
}

-(void)suppendTimerClick:(UIButton *)sender{
    [_timer suppendTimerSource];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
