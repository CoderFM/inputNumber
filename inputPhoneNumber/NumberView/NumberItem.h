//
//  NumerItem.h
//  inputPhoneNumber
//
//  Created by 周发明 on 16/9/8.
//  Copyright © 2016年 周发明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumberItem : NSObject

@property(nonatomic, copy)NSString *number;

@property(nonatomic, assign)BOOL isNumber;

@property(nonatomic, assign)BOOL isNoWrite;

+ (instancetype)numberItemWithNumber:(NSString *)number isNumber:(BOOL)isNumber;

@end