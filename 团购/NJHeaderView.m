//
//  NJHeaderView.m
//  01-团购
//
//  Created by apple on 14-5-28.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NJHeaderView.h"

@interface NJHeaderView ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollerView;

@end

@implementation NJHeaderView

+ (instancetype)headerView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"NJHeaderView" owner:nil options:nil] lastObject];
}
// init方法只有通过代码创建控件的时候才会调用
- (id)init
{
    if (self = [super init]) {
        // 添加imageview
        NSLog(@"init");
    }
    return self;
}

// 控件通过xib或者storyboard创建的时候就会调用
- (void)awakeFromNib
{
    NSLog(@"awakeFromNib");
    // 在这个地方给scrollView添加图片
}



// 控件通过xib或者storyboard创建的时候就会调用
//- (id)initWithCoder:(NSCoder *)aDecoder
//{
//    
//}
@end
