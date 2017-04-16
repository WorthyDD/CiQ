//
//  Model.h
//  CiQ
//
//  Created by 武淅 段 on 2017/4/16.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

+ (NSDictionary *)names;
+ (NSArray *)namesForKey:(NSString *)key;

+ (NSArray *)fontNames;

@end
