//
//  NumberCollectionCell.m
//  inputPhoneNumber
//
//  Created by 周发明 on 16/9/8.
//  Copyright © 2016年 周发明. All rights reserved.
//

#import "NumberCollectionCell.h"
#import "NumberItem.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define PROPORTION (SCREEN_WIDTH / 320.0)
#define RGBColor(r,g,b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1]

@interface NumberCollectionCell ()<UITextFieldDelegate>

@property(nonatomic, weak)UITextField *textFeild;

@end

@implementation NumberCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self textFeild];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFeildDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
        
    }
    return self;
}

- (void)setItem:(NumberItem *)item{
    
    _item = item;
    
    self.textFeild.text = item.number;
    
    if (item.isNoWrite) {
        self.textFeild.userInteractionEnabled = NO;
    } else {
        self.textFeild.userInteractionEnabled = YES;
    }
    
    if (item.isNumber) {
        self.textFeild.backgroundColor = RGBColor(242, 245, 235);
        self.textFeild.textColor = RGBColor(0, 0, 0);
    } else {
        self.textFeild.backgroundColor = [UIColor whiteColor];
        self.textFeild.textColor = RGBColor(252, 77, 48);
    }
}

- (UITextField *)textFeild{
    
    if (_textFeild == nil) {
        
        UITextField *textFeild = [[UITextField alloc] initWithFrame:self.bounds];
        
        textFeild.delegate = self;
        
        textFeild.borderStyle = UITextBorderStyleNone;
        
        textFeild.textAlignment = NSTextAlignmentCenter;
        
        textFeild.layer.cornerRadius = 5;
        
        textFeild.layer.masksToBounds = YES;
        
        textFeild.keyboardType = UIKeyboardTypePhonePad;
        
        textFeild.backgroundColor = [UIColor whiteColor];
        
        textFeild.placeholder = @"请输入手机号码";
        
        textFeild.textColor = RGBColor(252, 77, 48);
        
        textFeild.font = [UIFont systemFontOfSize:11 * PROPORTION];
        
        [textFeild addTarget:self action:@selector(textFeildDidChangeResiponde) forControlEvents:UIControlEventEditingDidEnd];
        
        [self.contentView addSubview:textFeild];
        
        _textFeild = textFeild;
    }
    return _textFeild;
}

- (void)textFeildDidChangeResiponde{
    
}

- (void)textFeildBecomeFirstResponder{
    [self.textFeild becomeFirstResponder];
}

- (void)textFeildDidChange:(NSNotification *)noti{
    
    if (noti.object == self.textFeild){
        
        if ([self isMobile:self.textFeild.text]) {
            self.item.isNumber = YES;
        } else {
            self.item.isNumber = NO;
        }
        
        self.item.number = self.textFeild.text;
        
        if (self.textFeildChangeBlock) {
            self.textFeildChangeBlock(self, self.item);
        }
        
        if (self.textFeild.text.length == 0){
            if (self.textFeildEmptyString) {
                self.textFeildEmptyString(self, self.item);
            }
        }
        
        if (self.textFeild.text.length > 10) {
            self.textFeild.text = [self.textFeild.text substringToIndex:11];
            if (![self isMobile:self.textFeild.text]) {
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确的手机号" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alert show];
            }
        }
        
        if ([self isMobile:self.textFeild.text]) {
            self.textFeild.backgroundColor = RGBColor(242, 245, 235);
            self.textFeild.textColor = RGBColor(0, 0, 0);
            if (self.nextNumberTextFeildBlock) {
                self.nextNumberTextFeildBlock();
            }
        } else {
            self.textFeild.backgroundColor = [UIColor whiteColor];
            self.textFeild.textColor = RGBColor(252, 77, 48);
        }
    }
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

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

