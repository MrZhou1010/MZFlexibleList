//
//  MZMomentsVC.m
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/5.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import "MZMomentsVC.h"
#import "MZHeaderListSectionController.h"
#import "MZContentListSectionController.h"
#import "MZLoctionListSectionController.h"
#import "MZTimeListSectionController.h"
#import "IGListStackedSectionController.h"
#import "MZNavigationView.h"
#import "MZRefreshHeader.h"
#import "MZListModel.h"
#import <IGListKit/IGListKit.h>
#import <MJExtension/MJExtension.h>

#define STATUSNAVHEIGHT ([[UIScreen mainScreen] bounds].size.height >= 812) ? 88.0 : 64.0

@interface MZMomentsVC () <IGListAdapterDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) MZNavigationView *navView;
@property (nonatomic, strong) IGListCollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) NSMutableArray<MZListModel *> *listModels;

@end

@implementation MZMomentsVC

#pragma mark - lazy
- (MZNavigationView *)navView {
    if (!_navView) {
        _navView = [[MZNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, STATUSNAVHEIGHT)];
    }
    return _navView;
}

- (IGListAdapter *)adapter {
    if (!_adapter) {
        IGListAdapterUpdater *updater = [[IGListAdapterUpdater alloc] init];
        _adapter = [[IGListAdapter alloc] initWithUpdater:updater viewController:self workingRangeSize:0];
        _adapter.dataSource = self;
        _adapter.scrollViewDelegate = self;
    }
    return _adapter;
}

- (IGListCollectionView *)collectionView {
   if (!_collectionView) {
        _collectionView = [[IGListCollectionView alloc] initWithFrame:CGRectZero];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        if (@available(iOS 11.0, *)) {
            _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.listModels = [NSMutableArray array];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.navView];
    [self initListData];
    [self addRefreshHeader];
    //[self addRefreshFooter];
    self.adapter.collectionView = self.collectionView;
    __weak typeof(self) weakSelf = self;
    self.navView.backBtnActionBlock = ^{
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf.navigationController popViewControllerAnimated:YES];
    };
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.frame;
}

- (void)initListData {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"listData" withExtension:@"json"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSArray *dataArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    [self.listModels addObjectsFromArray:[MZListModel mj_objectArrayWithKeyValuesArray:dataArr]];
}

- (void)addRefreshHeader {
    self.collectionView.mj_header = [MZRefreshHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.collectionView.mj_header endRefreshing];
        });
    }];
}

- (void)addRefreshFooter {
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.collectionView.mj_footer endRefreshing];
        });
    }];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.navView showNavigationViewWithAlpha:scrollView.contentOffset.y / 150];
}

#pragma mark - IGListAdapterDelegate, IGListAdapterDataSource
- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {
    UIView *emptyView = [[UIView alloc] init];
    emptyView.backgroundColor = [UIColor lightGrayColor];
    return emptyView;
}

- (nonnull IGListSectionController *)listAdapter:(nonnull IGListAdapter *)listAdapter sectionControllerForObject:(nonnull id)object {
    MZListModel *model = (MZListModel *)object;
    if (model.headImage) {
        MZHeaderListSectionController *sectionController = [[MZHeaderListSectionController alloc] init];
        return sectionController;
    } else {
        MZContentListSectionController *contentSC = [[MZContentListSectionController alloc] init];
        MZLoctionListSectionController *loctionSC = [[MZLoctionListSectionController alloc] init];
        MZTimeListSectionController *timeSC = [[MZTimeListSectionController alloc] init];
        IGListStackedSectionController *stackSC = [[IGListStackedSectionController alloc] initWithSectionControllers:@[contentSC, loctionSC, timeSC]];
        return stackSC;
    }
}

- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return self.listModels;
}

@end
