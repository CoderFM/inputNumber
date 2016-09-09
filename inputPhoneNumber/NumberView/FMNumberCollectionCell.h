//
//  NumberCollectionCell.h
//  inputPhoneNumber
//
//  Created by 周发明 on 16/9/8.
//  Copyright © 2016年 周发明. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FMNumberItem;
@interface FMNumberCollectionCell : UICollectionViewCell

@property(nonatomic, strong)FMNumberItem *item;

@property(nonatomic, copy)void(^nextNumberTextFeildBlock)();

@property(nonatomic, copy)void(^textFeildChangeBlock)(FMNumberCollectionCell *cell, FMNumberItem *item);

@property(nonatomic, copy)void(^textFeildEmptyString)(FMNumberCollectionCell *cell, FMNumberItem *item);

- (void)textFeildBecomeFirstResponder;

@end