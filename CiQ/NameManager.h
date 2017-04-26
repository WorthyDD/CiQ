//
//  NameManager.h
//  CiQ
//
//  Created by 武淅 段 on 2017/4/23.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NameManager : NSObject


@property (nonatomic) NSDictionary *names;

+ (instancetype)shareManager;


@end
