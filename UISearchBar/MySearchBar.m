//
//  MySearchBar.m
//  UISearchBar
//
//  Created by yanglin on 2018/3/9.
//  Copyright © 2018年 yanglin. All rights reserved.
//

#import "MySearchBar.h"


@implementation MySearchBar{
    
    __weak IBOutlet NSLayoutConstraint *textToRight;
    __weak IBOutlet NSLayoutConstraint *cancleWidth;
    __weak IBOutlet UITextField *textField;
    
    __weak IBOutlet UIButton *rightButton;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    UIImageView * m1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aaa1"]];
    UIImageView * m2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aaa2"]];
    m1.frame = CGRectMake(0, 0, 30, 30);
    m2.frame = CGRectMake(0, 0, 30, 30);
    textField.leftView = m1;
    textField.rightView = m2;
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.rightViewMode = UITextFieldViewModeAlways;

}

- (void)setShowsCancelButton:(BOOL)showsCancelButton animated:(BOOL)animated{

    self.showsCancelButton = showsCancelButton;
    if (showsCancelButton) {
        [UIView animateWithDuration:.3
                         animations:^{
                             textToRight.constant = 69;
                             rightButton.alpha = 1;
                             [self layoutIfNeeded];
                         }];
    } else {
        [UIView animateWithDuration:.3
                         animations:^{
                             textToRight.constant = 0;
                             [self layoutIfNeeded];
                         } completion:^(BOOL finished) {
                             
                         }];
        [UIView animateWithDuration:.2
                         animations:^{
                             rightButton.alpha = 0;
                             [self layoutIfNeeded];
                         } completion:^(BOOL finished) {
                             
                         }];
    }

}
- (CGSize)intrinsicContentSize
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 40);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (@available(iOS 11.0, *)){
        
    } else {
        
        if ([self.superview.class isMemberOfClass:[UINavigationBar class]]) {
            return ;
        }
        
        if (CGRectGetHeight(self.frame) != 44) {
            CGRect frame = self.frame;
            frame.size.height = 44;
            frame.origin.y = 0;
            self.frame = frame;
        }
    }
    
}

@end
