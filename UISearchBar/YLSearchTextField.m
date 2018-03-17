//
//  YLSearchTextField.m
//  UISearchBar
//
//  Created by yanglin on 2018/3/12.
//  Copyright © 2018年 yanglin. All rights reserved.
//

#import "YLSearchTextField.h"

@implementation YLSearchTextField
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.spaceToLeftView = 8;
        self.imageOrigionX = 8;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.spaceToLeftView = 8;
        self.imageOrigionX = 8;
    }
    return self;
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect frame = [super leftViewRectForBounds:bounds];
    frame.origin.x += self.imageOrigionX;
    return frame;
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect frame = [super textRectForBounds:bounds];
    frame.origin.x += self.spaceToLeftView;
    frame.size.width -= self.spaceToLeftView;
    return frame;
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect frame = [super editingRectForBounds:bounds];
    frame.origin.x += self.spaceToLeftView;
    frame.size.width -= self.spaceToLeftView;
    return frame;
}

- (void)setSpaceToLeftView:(CGFloat)spaceToLeftView{
    _spaceToLeftView = spaceToLeftView;
    [self layoutSubviews];
}
- (void)setImageOrigionX:(CGFloat)imageOrigionX
{
    _imageOrigionX = imageOrigionX;
    [self layoutSubviews];
}
@end
