//
//  ViewController.m
//  inputPhoneNumber
//
//  Created by 周发明 on 16/9/8.
//  Copyright © 2016年 周发明. All rights reserved.
//

#import "ViewController.h"
#import "NumberCollectionView.h"

@interface ViewController ()

@property(nonatomic, weak)NumberCollectionView *numberView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NumberCollectionView *view = [NumberCollectionView numberCollectionViewWithItemHeight:30 cloum:3];
    
    view.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:view];
    
    self.numberView = view;
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.numberView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
