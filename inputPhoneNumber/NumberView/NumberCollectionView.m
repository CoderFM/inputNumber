//
//  NumberCollectionView.m
//  明细
//
//  Created by 周发明 on 16/4/16.
//  Copyright © 2016年 周发明. All rights reserved.
//

#import "NumberCollectionView.h"
#import "NumberCollectionCell.h"
#import "NumberItem.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define PROPORTION (SCREEN_WIDTH / 320.0)
#define RGBColor(r,g,b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1]

@interface NumberCollectionView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, assign)NSInteger cloum;

@end

@implementation NumberCollectionView

+ (instancetype)numberCollectionViewWithItemHeight:(CGFloat)height{
    return [self numberCollectionViewWithItemHeight:height cloum:3];
}

+ (instancetype)numberCollectionViewWithItemHeight:(CGFloat)height cloum:(NSInteger)cloum{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = CGSizeMake((SCREEN_WIDTH - 50) / cloum, height);
    
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    NumberCollectionView *numberView = [[NumberCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    
    numberView.cloum = cloum;
    
    return numberView;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.delegate = self;
        
        self.dataSource = self;
        
        [self registerClass:[NumberCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([NumberCollectionCell class])];

    }
    return self;
}

#pragma mark - collectionDataSouce

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.numbers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NumberCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([NumberCollectionCell class]) forIndexPath:indexPath];
    
    __weak typeof(self)weakSelf = self;
    
    [cell setTextFeildChangeBlock:^(NumberCollectionCell *cell, NumberItem *item) {
        
        NSIndexPath *indexPath2 = [collectionView indexPathForCell:cell];
        
        [weakSelf.numbers replaceObjectAtIndex:indexPath2.row withObject:item];
        
    }];
    
    [cell setNextNumberTextFeildBlock:^{
        
        NumberItem *item = [weakSelf.numbers lastObject];
        
        NSString *number = item.number;
        
        if ([weakSelf isMobile:number]) {
            
            [weakSelf.numbers addObject:[NumberItem numberItemWithNumber:@"" isNumber:NO]];
            
            NSIndexPath *indexPath1 = [NSIndexPath indexPathForItem:weakSelf.numbers.count - 1 inSection:0];
            
            [collectionView insertItemsAtIndexPaths:@[indexPath1]];
            
            NSInteger count = weakSelf.numbers.count;
            
            NSInteger cloum = weakSelf.cloum;
            
            if ((count - 1) % cloum == 0) {
                
                NSInteger lines = count % cloum == 0 ? count / cloum : count / cloum + 1;
                
                CGPoint offset = CGPointMake(0, lines * (27 * PROPORTION + 10) + 10);
                
                if (offset.y > (SCREEN_WIDTH / 320 * 100)) {
                    
                    offset.y = offset.y - SCREEN_WIDTH / 320 * 100;
                    
                    offset.y = offset.y + 10;
                    
                    [collectionView setContentOffset:offset animated:NO];
                }
                
            }
            
            NumberCollectionCell *cell1 = (NumberCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath1];
            
            [cell1 textFeildBecomeFirstResponder];
        }
        
    }];
    
    [cell setTextFeildEmptyString:^(NumberCollectionCell *cell, NumberItem *item) {
        
        NSIndexPath *indexPath = [weakSelf indexPathForCell:cell];
        
        if (indexPath.row != weakSelf.numbers.count - 1) {
            
            NSIndexPath *indexPath1 = [NSIndexPath  indexPathForItem:self.numbers.count -1 inSection:0];
            NumberCollectionCell *cell1 = (NumberCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath1];
            [cell1 textFeildBecomeFirstResponder];
            
            [weakSelf.numbers removeObjectAtIndex:indexPath.row];
            
            [weakSelf deleteItemsAtIndexPaths:@[indexPath]];
        }
    }];
    
    if (indexPath.row < self.numbers.count) {
        
        cell.item = self.numbers[indexPath.row];
        
    }
    
    return cell;
}

- (BOOL) isMobile:(NSString *)mobileNumbel{
    if (mobileNumbel.length != 11)
    {
        return NO;
    }
    
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[017])\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    if (([regextestmobile evaluateWithObject:mobileNumbel] == YES)
        )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


- (NSMutableArray *)numbers{
    if (_numbers == nil) {
        _numbers = [@[[NumberItem numberItemWithNumber:@"" isNumber:NO]] mutableCopy];
    }
    return _numbers;
}

@end

