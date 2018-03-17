//
//  YLSearchBar.h
//  UISearchBar
//
//  Created by yanglin on 2018/3/12.
//  Copyright © 2018年 yanglin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YLSearchBar;
@protocol YLSearchBarDelegate <NSObject>

@optional
///结束编辑
- (void)ylSearchBarTextDidEndEditing:(YLSearchBar *)searchBar;
///文字改变
- (void)ylSearchBar:(YLSearchBar *)searchBar textDidChange:(NSString *)searchText;
///return
- (void)ylSearchBarSearchButtonClicked:(YLSearchBar *)searchBar;
///点击右侧按钮
- (void)ylSearchBarRightButtonClicked:(YLSearchBar *)searchBar;
@end
@interface YLSearchBar : UIView
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *rightButton;
///是否显示右侧按钮
@property (nonatomic, assign) BOOL showsRightButton;
@property (nonatomic, weak)   id<YLSearchBarDelegate> delegate;
///搜索图片
@property (nonatomic, strong) UIImage *searchImage;

- (void)setShowsCancelButton:(BOOL)showsRightButton animated:(BOOL)animated;

@end
