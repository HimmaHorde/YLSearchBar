//
//  YLSearchTextField.m
//  UISearchBar
//
//  Created by yanglin on 2018/3/12.
//  Copyright © 2018年 yanglin. All rights reserved.
//

#import "YLSearchTextField.h"

@implementation YLSearchTextField

- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect frame = [super leftViewRectForBounds:bounds];
    frame.origin.x += 8;
    return frame;
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    NSLog(@"11  %@",NSStringFromCGRect(bounds));
    return [super textRectForBounds:bounds];
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect frame = [super editingRectForBounds:bounds];
    frame.origin.x += 8;
    frame.size.width -= 8;
    return frame;
}

@end
