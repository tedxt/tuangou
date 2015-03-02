//
//  JHTgCell.h
//  团购
//
//  Created by piglikeyoung on 15/3/2.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHTg;

@interface JHTgCell : UITableViewCell

@property (nonatomic, strong) JHTg *tg;

+(instancetype) cellWithTableView:(UITableView *)tableView;

@end
