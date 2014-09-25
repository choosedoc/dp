//
//  DPMainPageViewController.m
//  DreamPlayer
//
//  Created by gajah on 14-9-23.
//  Copyright (c) 2014年 czl. All rights reserved.
//

#import "DPMainPageViewController.h"
#define SHOWPICNUM 10
#define PICANITIME 0.3f
@interface DPMainPageViewController () 
/// 首页tableview
@property (nonatomic,strong) UITableView *myTable;
/// 影片图片展示
@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation DPMainPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    self.myTable = [[UITableView alloc] initWithFrame:CGRectMake(0.f, 0.f, viewWidth, viewHeight) style:UITableViewStylePlain];
    self.myTable.showsHorizontalScrollIndicator = NO;
    self.myTable.dataSource = self;
    self.myTable.delegate = self;
    self.myTable.tableHeaderView = [self createTableHeader];
    [self.view addSubview:self.myTable];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark --table header
- (UIView *)createTableHeader
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 64.f, viewWidth, 200 * BH)];
    
    // scroller show
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.f, 0.f, headView.frame.size.width, headView.frame.size.height)];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * (SHOWPICNUM + 2) , headView.frame.size.height);
    [self showPicByNet];
    [headView addSubview:self.scrollView];
    // page control
    UIPageControl *pageCtl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, headView.frame.size.width, 50 * BH)];
    pageCtl.numberOfPages = SHOWPICNUM;
    pageCtl.layer.borderColor = COLOR_HALFBLACKMASK.CGColor;
    [pageCtl addTarget:self action:@selector(onPageControlChange:) forControlEvents:UIControlEventValueChanged];
    [headView addSubview:pageCtl];
    
    return headView;
}

#pragma mark --pic show in scrollview
- (void)showPicByNet
{
    NSString *regStr = @"^<div id=\"slider\" class=\"nivoSlider\">.*</div>$";
    [DPDownLoadManger getWebsiteSource:[NSURL URLWithString:@"http://www.tonghuacun.com"] block:^(BOOL isSucess, NSString *sourceCode) {
        if (isSucess) {
            NSRegularExpression *regRule = [NSRegularExpression regularExpressionWithPattern:regStr options:0 error:nil];
            NSTextCheckingResult *firstMatches = [regRule firstMatchInString:sourceCode options:0 range:NSMakeRange(0, sourceCode.length)];
            
            
            NSLog(@"==%@",[sourceCode substringWithRange:[firstMatches rangeAtIndex:0]]);
        }
    }];
}

#pragma mark --page control value changed
- (void)onPageControlChange:(UIPageControl *)pageControl
{
    [UIView animateWithDuration:PICANITIME animations:^{
        self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width * pageControl.currentPage, 0.f);
    }];
}

#pragma mark --table viewdelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
