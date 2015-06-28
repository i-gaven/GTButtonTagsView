//
//  GTButtonTagsView.m
//  GTDynamicLabels
//
//  Created by 赵国腾 on 15/6/25.
//  Copyright (c) 2015年 zhaoguoteng. All rights reserved.
//

#import "GTButtonTagsView.h"

const CGFloat intervalWide = 10.0f;     // label间隔宽度

@interface GTButtonTagsView ()

@property (nonatomic, assign) CGRect currentLabelFrame;

@end

@implementation GTButtonTagsView

- (void)awakeFromNib {
    
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"labels.plist" ofType:nil];
    self.dataArr = [NSArray arrayWithContentsOfFile:plistPath];
    
    self.currentLabelFrame = CGRectZero;
    
    // 布局label
    for (NSInteger i = 0; i < self.dataArr.count; i++) {
        
        NSString *str = self.dataArr[i];
        
        CGFloat x = self.currentLabelFrame.origin.x + self.currentLabelFrame.size.width;
        
        CGFloat y = self.currentLabelFrame.origin.y;
        
        if (i != 0) {
            x += intervalWide;
        }else {
            y += intervalWide;
        }
        
        CGSize size = [self labelSizeFromString:str];
        
        // 判断label是否到视图边界
        CGFloat minX = x;
        CGFloat maxX = x + size.width;
        
        size.height = 30.0f;
        
        if (maxX > CGRectGetWidth(self.frame)) {
            
            x -= minX;
            y = y + size.height + intervalWide;
        }
        
        // 计算label的frame
        CGRect rect = CGRectMake(x, y, size.width, size.height);
        
        self.currentLabelFrame = rect;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = rect;
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        //        button.backgroundColor = [UIColor yellowColor];
        [button setTitle:str forState:UIControlStateNormal];
        
        [button setBackgroundImage:[UIImage imageNamed:@"introduction_btn"] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [self addSubview:button];
        
    }
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    

    
}

// 根据文本计算label宽度
- (CGSize)labelSizeFromString:(NSString *)str {
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:20.0f]};
    return [str sizeWithAttributes:attributes];
}

// 标签点击事件
- (void)buttonAction:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(GTButtonTagsView:selectIndex:selectText:)]) {
        [self.delegate GTButtonTagsView:self selectIndex:sender.tag selectText:sender.titleLabel.text];
    }
}

@end
