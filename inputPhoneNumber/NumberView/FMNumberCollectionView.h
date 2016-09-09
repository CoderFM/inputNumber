//
//  NumberCollectionView.h
//  明细
//
//  Created by 周发明 on 16/4/16.
//  Copyright © 2016年 周发明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMNumberCollectionView : UICollectionView

+ (instancetype)numberCollectionViewWithItemHeight:(CGFloat)height;

+ (instancetype)numberCollectionViewWithItemHeight:(CGFloat)height cloum:(NSInteger) cloum;

@property(nonatomic, strong)NSMutableArray *numbers;

@end
