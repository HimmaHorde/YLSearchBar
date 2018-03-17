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
        [self addActions];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initSubviews];
        [self addActions];
    }
    return self;
}

#pragma mark - 事件监听

-(void)textFieldDidClickReturn{
    if ([self.delegate respondsToSelector:@selector(ylSearchBarSearchButtonClicked:)]) {
        [self.delegate ylSearchBarSearchButtonClicked:self];
    }
}
- (void)textFieldDidEndEditing
{
    if ([self.delegate respondsToSelector:@selector(ylSearchBarTextDidEndEditing:)]) {
        [self.delegate ylSearchBarTextDidEndEditing:self];
    }
}
- (void)textDidChage
{
    if ([self.delegate respondsToSelector:@selector(ylSearchBar:textDidChange:)]) {
        [self.delegate ylSearchBar:self textDidChange:_textField.text];
    }
}

- (void)rightClick
{
    if ([self.delegate respondsToSelector:@selector(ylSearchBarRightButtonClicked:)]) {
        [self.delegate ylSearchBarRightButtonClicked:self];
    }
}

#pragma mark - 初始化
- (void)addActions{
    self.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 44);
    [self.textField addTarget:self action:@selector(textDidChage) forControlEvents:UIControlEventEditingChanged];
    [self.textField addTarget:self action:@selector(textFieldDidEndEditing) forControlEvents:UIControlEventEditingDidEnd];
    [self.textField addTarget:self action:@selector(textFieldDidClickReturn) forControlEvents:UIControlEventEditingDidEnd];
}
- (void)initSubviews
{
    [self addSubview:self.textField];
    [self addSubview:self.rightButton];
    self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    self.rightButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray *conts1 =  [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[T]-8-[B(53)]" options:0 metrics:nil views:@{@"T":_textField,@"B":_rightButton}];
    [self addConstraints:conts1];
    
    //textField 高度
    NSArray *conts2 =  [NSLayoutConstraint constraintsWithVisualFormat:@"V:[T(36)]" options:0 metrics:nil views:@{@"T":_textField,}];
    //button 高度
    NSArray *conts3 =  [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[B]-0-|" options:0 metrics:nil views:@{@"B":_rightButton}];
    [self addConstraints:conts2];
    [self addConstraints:conts3];
    //居中显示
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_textField attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_rightButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    //textField 居右的距离
    _textToRight = [NSLayoutConstraint constraintWithItem:_textField attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    [self addConstraint:_textToRight];
    
    self.clipsToBounds = YES;
    
    UIImageView * image  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yl_search_iocn"]];
    image.frame = CGRectMake(0, 0, 16, 16);
    self.textField.leftView = image;
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    self.textField.clearButtonMode  = UITextFieldViewModeWhileEditing;
}

- (void)setShowsRightButton:(BOOL)showsRightButton
{
    if (_showsRightButton == showsRightButton) {
        return;
    }
    [self endEditing:YES];
    _showsRightButton = showsRightButton;
    if (showsRightButton) {
        _textToRight.constant = -69;
        _rightButton.alpha = 1;
    } else {
        _textToRight.constant = 0;
        _rightButton.alpha = 0;
    }
    [self layoutSubviews];
}

- (void)setShowsCancelButton:(BOOL)showsRightButton animated:(BOOL)animated{
    if (_showsRightButton == showsRightButton) {
        return;
    }
    [self endEditing:YES];
    _showsRightButton = showsRightButton;
    if (showsRightButton) {
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
- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[YLSearchTextField alloc] init];
        _textField.textColor = [UIColor blackColor];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.font = [UIFont systemFontOfSize:15];
        _textField.returnKeyType = UIReturnKeySearch;
    }
    return _textField;
}

- (UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_rightButton setTitle:@"搜索" forState:UIControlStateNormal];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_rightButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

@end
