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
@interface DPMainPageViewController () <UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
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
    [headView addSubview:self.scrollView];
    // page control
    UIPageControl *pageCtl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, headView.frame.size.width, 50 * BH)];
    pageCtl.numberOfPages = SHOWPICNUM;
    pageCtl.layer.borderColor = COLOR_HALFBLACKMASK.CGColor;
    [pageCtl addTarget:self action:@selector(onPageControlChange:) forControlEvents:UIControlEventValueChanged];
    [headView addSubview:pageCtl];
    
    return headView;
}

#pragma mark --page control value changed
- (void)onPageControlChange:(UIPageControl *)pageControl
{
    [UIView animateWithDuration:PICANITIME animations:^{
        self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width * pageControl.currentPage, 0.f);
    }];
}

@end
