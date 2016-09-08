//
//  NumerItem.m
//  inputPhoneNumber
//
//  Created by 周发明 on 16/9/8.
//  Copyright © 2016年 周发明. All rights reserved.
//

#import "NumberItem.h"

@implementation NumberItem

+ (instancetype)numberItemWithNumber:(NSString *)number isNumber:(BOOL)isNumber{
    
    NumberItem *item = [[NumberItem alloc] init];
    
    item.number = number;
    
    item.isNumber = isNumber;
    
    item.isNoWrite = NO;
    
    return item;
    
}

@end
