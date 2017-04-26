//
//  NameManager.m
//  CiQ
//
//  Created by 武淅 段 on 2017/4/23.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "NameManager.h"

@implementation NameManager

+ (instancetype)shareManager {
  
    static dispatch_once_t token;
    static NameManager *manager;
    dispatch_once(&token, ^{
        manager = [[NameManager alloc] init];
        [manager readNamesFromFile];
    });
    return manager;
}

- (void)readNamesFromFile {
    
    NSMutableDictionary *names = [NSMutableDictionary new];
    NSString *path = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:@"/name.txt"];
    NSError *error;
    NSString *result = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"读取错误 %@", error);
    } else {
        
        NSArray *lines = [result componentsSeparatedByString:@"\n"];
        for (NSString *value in lines) {
            NSArray *n = [value componentsSeparatedByString:@" "];
            if (n.count == 2) {
                NSString *en = n[0];
                NSString *ch = n[1];
                if (![names.allKeys containsObject:en]) {
                    names[en] = ch;
                }
            }
        }
    }
    self.names = names.copy;
}

@end
