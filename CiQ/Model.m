//
//  Model.m
//  CiQ
//
//  Created by 武淅 段 on 2017/4/16.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "Model.h"
#import "NameManager.h"

@implementation Model


+ (NSDictionary *)names {
    return [NameManager shareManager].names;
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
