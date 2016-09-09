//
//  NumerItem.m
//  inputPhoneNumber
//
//  Created by 周发明 on 16/9/8.
//  Copyright © 2016年 周发明. All rights reserved.
//

#import "FMNumberItem.h"

@implementation FMNumberItem

+ (instancetype)numberItemWithNumber:(NSString *)number isNumber:(BOOL)isNumber{
    
    FMNumberItem *item = [[FMNumberItem alloc] init];
    
    item.number = number;
    
    item.isNumber = isNumber;
    
    item.isNoWrite = NO;
    
    return item;
    
}

@end
