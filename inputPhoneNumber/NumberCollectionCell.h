//
//  NumberCollectionCell.h
//  inputPhoneNumber
//
//  Created by 周发明 on 16/9/8.
//  Copyright © 2016年 周发明. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NumberItem;
@interface NumberCollectionCell : UICollectionViewCell

@property(nonatomic, strong)NumberItem *item;

@property(nonatomic, copy)void(^nextNumberTextFeildBlock)();

@property(nonatomic, copy)void(^textFeildChangeBlock)(NumberCollectionCell *cell, NumberItem *item);

@property(nonatomic, copy)void(^textFeildEmptyString)(NumberCollectionCell *cell, NumberItem *item);

- (void)textFeildBecomeFirstResponder;

@end