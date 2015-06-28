//
//  ViewController.m
//  GTDynamicLabels
//
//  Created by 赵国腾 on 15/6/24.
//  Copyright (c) 2015年 zhaoguoteng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushMethod:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"GTDynamicLabelsController" sender:self];
}

@end
