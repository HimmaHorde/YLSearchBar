//
//  YLSearchBar.h
//  UISearchBar
//
//  Created by yanglin on 2018/3/12.
//  Copyright © 2018年 yanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLSearchBar : UIView
@property (nonatomic, strong) UITextField *textfield;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, assign) BOOL showsCancelButton;

- (void)setShowsCancelButton:(BOOL)showsCancelButton animated:(BOOL)animated;

@end
