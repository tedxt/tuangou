//
//  JHFooterView.m
//  团购
//
//  Created by piglikeyoung on 15/3/2.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHFooterView.h"
#import "ViewController.h"

@interface JHFooterView()

/**
 *  菊花视图
 */
@property (weak, nonatomic) IBOutlet UIView *loadingView;
/**
 *  按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *loadBtn;

@end

@implementation JHFooterView

- (IBAction)btnOnClick {
    NSLog(@"按钮被点击了");

    // 1.隐藏按钮
    self.loadBtn.hidden = YES;
    // 2.显示菊花
    self.loadingView.hidden = NO;
    
    #warning 模拟发送网络请求, 1秒之后隐藏菊花
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 3.调用控制的加载数据方法
        [self.controller loadMoreData];
        // 4.隐藏菊花视图
        self.loadingView.hidden = YES;
        // 5.显示按钮
        self.loadBtn.hidden = NO;
        
    });
    
}

@end
