//
//  ObjcDemoViewController.m
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/10.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import "ObjcDemoViewController.h"
#import "PostSectionController.h"
#import "Post.h"
#import <IGListKit/IGListKit.h>

@interface ObjcDemoViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) NSArray<Post *> *data;

@end

@implementation ObjcDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.data = @[
        [[Post alloc] initWithUsername:@"userA"
                              comments:@[
                                  @"Luminous triangle",
                                  @"Awesome",
                                  @"Super clean",
                                  @"Stunning shot",
                              ]],
        [[Post alloc] initWithUsername:@"userB"
                              comments:@[
                                  @"The simplicity here is superb",
                                  @"thanks!",
                                  @"That's always so kind of you!",
                                  @"I think you might like this",
                              ]],
        [[Post alloc] initWithUsername:@"userC"
                              comments:@[
                                  @"So good",
                              ]],
        [[Post alloc] initWithUsername:@"userD"
                              comments:@[
                                  @"hope she might like it.",
                                  @"I love it."
                              ]],
    ];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
    [self.view addSubview:self.collectionView];
    self.adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init] viewController:self];
    self.adapter.dataSource = self;
    self.adapter.collectionView = self.collectionView;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

#pragma mark - IGListAdapterDataSource
- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.data;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return [PostSectionController new];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

@end
