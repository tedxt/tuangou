//
//  ViewController.m
//  团购
//
//  Created by piglikeyoung on 15/3/2.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "ViewController.h"
#import "JHTg.h"
#import "JHTgCell.h"

@interface ViewController ()<UITableViewDataSource>

@property(nonatomic,strong) NSArray *tgs;

@end

@implementation ViewController

#pragma mark - 懒加载
- (NSArray *)tgs
{
    if (_tgs == nil) {
        NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:fullPath];
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            JHTg *tg = [JHTg tgWithDict:dict];
            [models addObject:tg];
        }
        self.tgs = [models copy];
    }
    return _tgs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tgs.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    JHTgCell *cell = [JHTgCell cellWithTableView:tableView];
    
    // 2.设置数据
    // 2.1取出对应行的模型
    JHTg *tg = self.tgs[indexPath.row];
    // 2.2设置模型数据给cell
    cell.tg = tg;
    // 3.返回cell
    return cell;
}

#pragma mark -隐藏状态栏
-(BOOL) prefersStatusBarHidden
{
    return YES;
}

@end
