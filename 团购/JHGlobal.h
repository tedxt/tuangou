//
//  JHGlobal.h
//  团购
//
//  Created by piglikeyoung on 15/3/2.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#ifndef ___JHGlobal_h
#define ___JHGlobal_h

#define JHInitH(name)\
- (instancetype)initWithDict:(NSDictionary *)dict; \
+ (instancetype)name##WithDict:(NSDictionary *)dict;

#define JHInitM(name)\
- (instancetype)initWithDict:(NSDictionary *)dict \
{ \
    if (self = [super init]) { \
        [self setValuesForKeysWithDictionary:dict]; \
    } \
    return self; \
} \
+ (instancetype)name##WithDict:(NSDictionary *)dict \
{ \
    return [[self alloc] initWithDict:dict]; \
}


#endif
