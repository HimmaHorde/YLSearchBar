//
//  YLSearchBar.m
//  UISearchBar
//
//  Created by yanglin on 2018/3/12.
//  Copyright © 2018年 yanglin. All rights reserved.
//

#import "YLSearchBar.h"
#import "YLSearchTextField.h"
@interface YLSearchBar()<UITextFieldDelegate>

@end
@implementation YLSearchBar{
    NSLayoutConstraint *_textToRight;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initSubviews];
        self.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 44);
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews
{
    [self addSubview:self.textfield];
    [self addSubview:self.rightButton];
    self.textfield.translatesAutoresizingMaskIntoConstraints = NO;
    self.rightButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray *conts1 =  [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[T]-8-[B(53)]" options:0 metrics:nil views:@{@"T":_textfield,@"B":_rightButton}];
    [self addConstraints:conts1];
    
    //textfield 高度
    NSArray *conts2 =  [NSLayoutConstraint constraintsWithVisualFormat:@"V:[T(36)]" options:0 metrics:nil views:@{@"T":_textfield,}];
    //button 高度
    NSArray *conts3 =  [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[B]-0-|" options:0 metrics:nil views:@{@"B":_rightButton}];
    [self addConstraints:conts2];
    [self addConstraints:conts3];
    //居中显示
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_textfield attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_rightButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    //textfield 居右的距离
    _textToRight = [NSLayoutConstraint constraintWithItem:_textfield attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    [self addConstraint:_textToRight];
    
    self.clipsToBounds = YES;
    
    UIImageView * image  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yl_search_iocn"]];
    image.frame = CGRectMake(0, 0, 16, 16);
    self.textfield.leftView = image;
    self.textfield.leftViewMode = UITextFieldViewModeAlways;
    self.textfield.clearButtonMode  = UITextFieldViewModeWhileEditing;
    self.textfield.delegate = self;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.textfield.subviews[1].clipsToBounds = YES;
}

- (void)setShowsCancelButton:(BOOL)showsCancelButton
{
    if (_showsCancelButton == showsCancelButton) {
        return;
    }
    [self endEditing:YES];
    _showsCancelButton = showsCancelButton;
    if (showsCancelButton) {
        _textToRight.constant = -69;
        _rightButton.alpha = 1;
    } else {
        _textToRight.constant = 0;
        _rightButton.alpha = 0;
    }
    [self layoutSubviews];
}

- (void)setShowsCancelButton:(BOOL)showsCancelButton animated:(BOOL)animated{
    if (_showsCancelButton == showsCancelButton) {
        return;
    }
    [self endEditing:YES];
    _showsCancelButton = showsCancelButton;
    if (showsCancelButton) {
        [UIView animateWithDuration:.3
                         animations:^{
                             _textToRight.constant = - 69;
                             _rightButton.alpha = 1;
                             [self layoutSubviews];
                         }];
    } else {
        [UIView animateWithDuration:.3
                         animations:^{
                             _textToRight.constant = 0;
                         } completion:^(BOOL finished) {
                             
                         }];
        [UIView animateWithDuration:.2
                         animations:^{
                             _rightButton.alpha = 0;
                             [self layoutSubviews];
                         } completion:^(BOOL finished) {
                             
                         }];
    }
    
}
- (CGSize)intrinsicContentSize
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 44);
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    if (@available(iOS 11.0, *)){

    } else {
        if ([self.superview isMemberOfClass:[UINavigationBar class]]) {
            if (CGRectGetHeight(self.frame) != 44) {
                CGRect frame = self.frame;
                frame.size.height = 44;
                frame.origin.y = 0;
                self.frame = frame;
            }
        }
    }
}
#pragma mark - lazy
- (UITextField *)textfield
{
    if (!_textfield) {
        _textfield = [[YLSearchTextField alloc] init];
        _textfield.textColor = [UIColor blackColor];
        _textfield.borderStyle = UITextBorderStyleRoundedRect;
        _textfield.font = [UIFont systemFontOfSize:15];
    }
    return _textfield;
}

- (UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_rightButton setTitle:@"搜索" forState:UIControlStateNormal];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _rightButton;
}

@end
