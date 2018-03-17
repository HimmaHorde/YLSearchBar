//
//  ViewController.m
//  UISearchBar
//
//  Created by yanglin on 2018/3/9.
//  Copyright © 2018年 yanglin. All rights reserved.
//

#import "ViewController.h"
#import "YLSearchBar.h"

@interface ViewController ()
@property (nonatomic, strong) UISearchBar * bar;
@property (nonatomic, strong) YLSearchBar * searchBar ;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UITextField *ttttt;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchBar = [[YLSearchBar alloc] init];
    _searchBar.showsRightButton = YES;
    
    _bar = [[UISearchBar alloc] init];
    
    _searchBar.frame = CGRectMake(0, 0, 414, 44);
    [self.containerView addSubview:_searchBar];
    UIImageView * image  = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"you@2x" ofType:@"png"]]];
    image.frame = CGRectMake(0, 0, 44, 40);
    _ttttt.leftView =  image;
    _ttttt.leftViewMode = UITextFieldViewModeAlways;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_searchBar setShowsCancelButton:!_searchBar.showsRightButton animated:YES];
}

@end
