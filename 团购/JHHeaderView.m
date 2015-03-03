//
//  JHHeaderView.m
//  团购
//
//  Created by piglikeyoung on 15/3/3.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHHeaderView.h"

#define ImageCount 5

@interface JHHeaderView()<UIScrollViewDelegate>

@property (weak,nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong,nonatomic) NSTimer *timer;

@end


@implementation JHHeaderView

+ (instancetype)headerView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"JHHeaderView" owner:nil options:nil] lastObject];
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
    CGFloat width = self.scrollView.frame.size.width;
    CGFloat height = self.scrollView.frame.size.height;
    
    // 将图片添加的scrollView
    for (int i = 1; i<ImageCount + 1; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        CGFloat imageX = (i - 1) * width;
        CGFloat imageY = 0.f;
        imageView.frame = CGRectMake(imageX, imageY, width, height);
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"ad_%02d",i]];
        [self.scrollView addSubview:imageView];
    }
    
    // 设置可滚动区域
    self.scrollView.contentSize = CGSizeMake(ImageCount * width, height);
    // 拖动分页
    self.scrollView.pagingEnabled = YES;
    // 设置代理
    self.scrollView.delegate = self;
    // 设置总页数
    self.pageControl.numberOfPages = ImageCount;
    
    [self addScrollTimer];
}


#pragma mark - UIScrollViewDelegate实现方法 -
-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    //    NSLog(@"scrollViewDidScroll");
    // 计算页码，当滚动超过半屏的时候就会进入下一页
    CGPoint offset = self.scrollView.contentOffset;// scrollView显示的坐标
    CGFloat offsetX = offset.x;
    CGFloat width = self.scrollView.frame.size.width;// 一屏的宽度
    int pageNum = (offsetX + .5f * width) / width;// 滚动的距离 + 半屏的距离>一屏的宽度 就是到了下一屏
    self.pageControl.currentPage = pageNum;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeScrollTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self addScrollTimer];
}

/** 创建定时器 */
- (void)addScrollTimer
{
    
    // 这种创建方式，会主动添加到主循环中，即默认会执行，但当用户按住其他控件的时候，它就会停止执行，当放开控件，它才继续执行
    //     self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
    // 这种创建方式，不会主动添加到主循环中，得手动添加，他有两种执行模式
    self.timer = [NSTimer timerWithTimeInterval:1.f target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
    // NSRunLoopCommonModes 按住其它控件，不会停止执行
    // NSDefaultRunLoopMode 按住其它控件，会停止执行，和第一种方式一样
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}

/** 移除定时器 */
- (void)removeScrollTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

/** 下一页 */
- (void)nextPage
{
    int currentPage = self.pageControl.currentPage;
    currentPage++;
    if (currentPage == ImageCount) {
        currentPage = 0;
    }
    
    CGFloat width = self.scrollView.frame.size.width;
    CGPoint offset = CGPointMake(currentPage * width, 0.f);
    //    self.scrollView.contentOffset = offset;
    [self.scrollView setContentOffset:offset animated:YES];
}



// 控件通过xib或者storyboard创建的时候就会调用
//- (id)initWithCoder:(NSCoder *)aDecoder
//{
//
//}

@end