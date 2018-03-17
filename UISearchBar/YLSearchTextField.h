//
//  YLSearchTextField.h
//  UISearchBar
//
//  Created by yanglin on 2018/3/12.
//  Copyright © 2018年 yanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLSearchTextField : UITextField
///文本距离 leftView 的距离 默认8
@property (nonatomic, assign) CGFloat spaceToLeftView;
///图片的距离左侧的距离 默认8
@property (nonatomic, assign) CGFloat imageOrigionX;

@end
