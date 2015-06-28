//
//  GTButtonTagsView.h
//  GTDynamicLabels
//
//  Created by 赵国腾 on 15/6/25.
//  Copyright (c) 2015年 zhaoguoteng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GTButtonTagsViewDelegate;
@interface GTButtonTagsView : UIView


/**
 *  代理
 */
@property (nonatomic, weak) id<GTButtonTagsViewDelegate> delegate;

/**
 *  数据集合
 */
@property (nonatomic, strong) NSArray *dataArr;

@end


@protocol GTButtonTagsViewDelegate <NSObject>

- (void)GTButtonTagsView:(GTButtonTagsView *)view selectIndex:(NSInteger)index selectText:(NSString *)text;

@end