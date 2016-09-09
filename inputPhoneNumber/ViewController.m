//
//  ViewController.m
//  inputPhoneNumber
//
//  Created by 周发明 on 16/9/8.
//  Copyright © 2016年 周发明. All rights reserved.
//

#import "ViewController.h"
#import "FMNumberCollectionView.h"

@interface ViewController ()

@property(nonatomic, weak)FMNumberCollectionView *numberView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    FMNumberCollectionView *view = [FMNumberCollectionView numberCollectionViewWithItemHeight:30 cloum:2];
    
    view.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:view];
    
    self.numberView = view;
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.numberView.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height * 0.3);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
