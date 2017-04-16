//
//  Model.m
//  CiQ
//
//  Created by 武淅 段 on 2017/4/16.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "Model.h"

@implementation Model


+ (NSDictionary *)names {
    static NSDictionary *dic;
    if (!dic) {
        dic = @{@"Jack" : @"杰克",
                @"Allen" : @"艾伦",
                @"Luis" : @"路易斯",
                @"Tom" : @"汤姆"};
    }
    return dic;
}

+ (NSArray *)namesForKey:(NSString *)key {
    NSMutableArray *arr = [NSMutableArray new];
    for (NSString *name in [Model names].allKeys) {
        if ([name containsString:key]) {
            [arr addObject: [Model names][name]];
        }
    }
    return arr.copy;
}


+ (NSArray *)fontNames {
    static NSArray *arr;
    if (!arr) {
        arr = @[@"隶变-简"];
    }
    return arr;
}
@end
