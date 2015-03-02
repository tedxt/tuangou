//
//  ViewController.m
//  团购
//
//  Created by piglikeyoung on 15/3/2.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "ViewController.h"
#import "JHTgModel.h"
#import "JHTgCell.h"
#import "JHFooterView.h"

@interface ViewController ()<UITableViewDataSource>

@property(nonatomic,strong) NSMutableArray *tgs;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

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
            JHTgModel *tg = [JHTgModel tgWithDict:dict];
            [models addObject:tg];
        }
        self.tgs = [models mutableCopy];
    }
    return _tgs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加tableview的底部视图
    // 注意:给tableview添加footerView不用设置宽度, 宽度默认和tableveiw一样宽
    // self.tableView.tableFooterView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    /*
     UIButton *btn = [[UIButton alloc] init];
     btn.backgroundColor = [UIColor orangeColor];
     [btn setTitle:@"查看全部团购" forState:UIControlStateNormal];
     btn.frame = CGRectMake(10, 0, 300, 44);
     self.tableView.tableFooterView = btn;
     */
    
    // 第一种获取方式
//    [[[NSBundle mainBundle] loadNibNamed:@"JHFooterView" owner:nil options:nil] firstObject];
    
    // 第二种获取方式
    UINib *nib = [UINib nibWithNibName:@"JHFooterView" bundle:nil];
    JHFooterView *footerView = [[nib instantiateWithOwner:nil options:nil] firstObject];
    self.tableView.tableFooterView = footerView;
    
    // 设置控制
    footerView.controller = self;

}

-(void)loadMoreData{
    
    // 1.创建模型
    JHTgModel *tg = [[JHTgModel alloc] init];
    
    tg.title = @"铁板扫";
    tg.price = @"128";
    tg.buyCount = @"0";
    tg.icon = @"2c97690e72365e38e3e2a95b934b8dd2";
    // 2.将模型添加到数组中
    [self.tgs addObject : tg];
    // 3.刷新表格
    [self.tableView reloadData];
    
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
    JHTgModel *tg = self.tgs[indexPath.row];
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
