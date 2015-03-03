//
//  JHFooterView.h
//  团购
//
//  Created by piglikeyoung on 15/3/2.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController,JHFooterView;

/*
 格式(编码规范)
 协议名称 : 控件名称 + Delegate
 协议方法名称:控件名称去掉前缀 + 含义
 在协议方法中将自己(触发发放的)控件传出去的目的是方便用于区分哪个控件触发了该方法
 */
@protocol JHFooterViewDelegete <NSObject>

@optional

-(void) footerViewDidClickLoadBtn:(JHFooterView *)footerView;

@end

@interface JHFooterView : UIView

@property (nonatomic,weak) id<JHFooterViewDelegete> delegate;

@end

