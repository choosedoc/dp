//
//  DPTabBarViewController_iPhone.m
//  DreamPlayer
//
//  Created by gajah on 14-9-23.
//  Copyright (c) 2014年 czl. All rights reserved.
//

#import "DPTabBarViewController_iPhone.h"

@interface DPTabBarViewController_iPhone ()
@property (nonatomic,strong) UIToolbar *toolBar;
@end

@implementation DPTabBarViewController_iPhone

#pragma mark --view lifecycle
- (void)loadView
{
    [super loadView];
    DPMainPageViewController *mainViewControll = [[DPMainPageViewController alloc] init];
    
    self.viewControllers = @[mainViewControll];

    NSArray *btnTitleArr = @[@"首页",@"分类",@"设置"];
    NSArray *btnImageArr = @[@"home_tabbar_icon_home",@"home_tabbar_icon_home_sel",@"home_tabbar_icon_channel",@"home_tabbar_icon_channel_sel",@"home_tabbar_icon_setting",@"home_tabbar_icon_setting_sel"];
    self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.f,viewHeight - 50.f, viewWidth, 50.f)];
    NSMutableArray *btnArr = [NSMutableArray array];
    for (int i = 0; i < btnTitleArr.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i * (self.toolBar.frame.size.width / btnTitleArr.count), 0.f, self.toolBar.frame.size.width / btnTitleArr.count, self.toolBar.frame.size.height);
        [btn setTitle:btnTitleArr[i] forState:UIControlStateNormal];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(30, -80, 0, 0)];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(-10, -25, 0, 0)];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:RGBA(24.f, 113.f, 212.f, 1.f) forState:UIControlStateDisabled];
        btn.tag = 100 + i;
        UIImage *normalImage = [UIImage imageNamed:btnImageArr[i*2]];
        UIImage *higlightImage = [UIImage imageNamed:btnImageArr[i*2+1]];
        [btn setImage:[UIImage imageWithCGImage:normalImage.CGImage scale:2.2f orientation:UIImageOrientationUp] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageWithCGImage:higlightImage.CGImage scale:2.2f orientation:UIImageOrientationUp] forState:UIControlStateDisabled];
        [btn addTarget:self action:@selector(onSwitchVC:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [btnArr addObject:btnItem];
    }
    self.toolBar.items = btnArr;
    self.tabBar.hidden = YES;
    [self.view addSubview:self.toolBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --button actions
- (void)onSwitchVC:(UIButton *)button
{
    for (int  i = 100; i < 103; i ++) {
        [(UIButton *)[self.toolBar viewWithTag:i] setEnabled:YES];
    }
    button.enabled = NO;

}

@end
