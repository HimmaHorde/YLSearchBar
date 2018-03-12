//
//  MySearchBar.h
//  UISearchBar
//
//  Created by yanglin on 2018/3/9.
//  Copyright © 2018年 yanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MySearchBar : UIView
@property (nonatomic, assign) BOOL showsCancelButton;
- (void)setShowsCancelButton:(BOOL)showsCancelButton animated:(BOOL)animated;
@end
