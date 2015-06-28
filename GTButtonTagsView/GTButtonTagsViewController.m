//
//  GTDynamicLabelsController.m
//  GTDynamicLabels
//
//  Created by 赵国腾 on 15/6/24.
//  Copyright (c) 2015年 zhaoguoteng. All rights reserved.
//

#import "GTButtonTagsViewController.h"
#import "GTButtonTagsView.h"

@interface GTButtonTagsViewController () <GTButtonTagsViewDelegate>

@property (nonatomic, weak) IBOutlet GTButtonTagsView *labelsView;

@end

@implementation GTButtonTagsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.labelsView.delegate = self;
}


- (void)GTButtonTagsView:(GTButtonTagsView *)view selectIndex:(NSInteger)index selectText:(NSString *)text {
    
    NSLog(@"第: %ld 文本: %@", index, text);
    
}

@end
