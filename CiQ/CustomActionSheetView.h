//
//  CustomActionSheetView.h
//  EmployeeAssistant
//
//  Created by 武淅 段 on 17/04/19.
//  Copyright © 2017年 . All rights reserved.

//

#import <UIKit/UIKit.h>


typedef void(^tapHandler) (NSInteger itemIndex);

@interface CustomActionSheetView : UIView


@property (nonatomic, copy) tapHandler handler;
@property (nonatomic, assign) NSInteger selectedIndex;

- (instancetype) initWithTitle : (NSString *) title items : (NSArray *)items;
- (void) show;

@end
