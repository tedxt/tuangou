//
//  JHTg.h
//  团购
//
//  Created by piglikeyoung on 15/3/2.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHGlobal.h"

@interface JHTg : NSObject

/**
 *  已购买人数
 */
@property (nonatomic, copy) NSString *buyCount;
/**
 *  图标
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  价格
 */
@property (nonatomic, copy) NSString *price;
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;

JHInitH(tg)

@end
