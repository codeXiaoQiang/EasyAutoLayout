//
//  ViewController.m
//  EasyAutoLayout
//
//  Created by yangtao on 3/9/16.
//  Copyright © 2016 yangtao. All rights reserved.
//

#import "ViewController.h"
#import "UIView+AutoLayout.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
    //[redView RT_FillWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) referView:self.view];
    
    NSArray *arry = @[redView, greenView];
    [self.view RT_HorizontalTile:arry insets:UIEdgeInsetsMake(10, 10, 10, 10)];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
