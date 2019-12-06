//
//  MZRefreshHeader.m
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/5.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import "MZRefreshHeader.h"

@interface MZRefreshHeader ()

@property (nonatomic, strong) UIImageView *rotateImageView;

@end

@implementation MZRefreshHeader

- (void)prepare {
    [super prepare];
    self.ignoredScrollViewContentInsetTop = -88;
    self.mj_h = 60;
    self.rotateImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"refresh"]];
    [self addSubview:self.rotateImageView];
}

- (void)placeSubviews {
    [super placeSubviews];
    self.rotateImageView.frame = CGRectMake(30, 0, 30, 30);
}

#pragma mark -- 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change {
    [super scrollViewContentOffsetDidChange:change];
    self.mj_y = -self.mj_h - self.ignoredScrollViewContentInsetTop;
    CGFloat pullingY = fabs(self.scrollView.mj_offsetY + 88 + self.ignoredScrollViewContentInsetTop);
    if (pullingY >= 60) {
        CGFloat marginY = -pullingY - self.ignoredScrollViewContentInsetTop;
        self.mj_y = marginY;
    }
    [UIView animateWithDuration:2 animations:^{
        self.rotateImageView.transform = CGAffineTransformRotate(self.rotateImageView.transform, M_PI * 0.5);
    }];
}

- (void)setState:(MJRefreshState)state {
    MJRefreshCheckState;
    switch (state) {
        case MJRefreshStateIdle:
            self.rotateImageView.hidden = YES;
            break;
        case MJRefreshStatePulling:
            self.rotateImageView.hidden = NO;
            break;
        case MJRefreshStateRefreshing:
            self.rotateImageView.hidden = NO;
            break;
        default:
            break;
    }
}

@end
