//
//  JHTgCell.m
//  团购
//
//  Created by piglikeyoung on 15/3/2.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHTgCell.h"
#import "JHTg.h"

@interface JHTgCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;
@end

@implementation JHTgCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"tg";
    // 1.取缓存中取
    JHTgCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建cell
    if (cell == nil) {
        // 如果找不到就从xib中创建cell
        cell =  [[[NSBundle mainBundle] loadNibNamed:@"JHTgCell" owner:nil options:nil] firstObject];
        NSLog(@"创建一个新的cell");
        
        // cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

-(void)setTg:(JHTg *)tg
{
    _tg = tg;
    
    // 设置图片
    self.iconView.image = [UIImage imageNamed:tg.icon];
    // 设置标题
    self.titleLabel.text = tg.title;
    // 设置价格
    self.priceLabel.text = [NSString stringWithFormat:@"$%@",tg.price];
    // 设置购买人数
    self.buyCountLabel.text = [NSString stringWithFormat:@"%@已购买",tg.buyCount];
}

@end
