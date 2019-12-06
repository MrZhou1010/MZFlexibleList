//
//  MZNavigationView.m
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/5.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import "MZNavigationView.h"

@interface MZNavigationView ()

@property (nonatomic, strong) UIView *navView;
@property (nonatomic, strong) UILabel *navTitleLbl;
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UIButton *rightBtn;

@end

@implementation MZNavigationView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    UIView *navView = [[UIView alloc] initWithFrame:self.bounds];
    navView.backgroundColor = [UIColor lightGrayColor];
    navView.alpha = 0.0;
    [self addSubview:navView];
    self.navView = navView;
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(16, navView.frame.size.height - 44 + (44 - 30) * 0.5, 30, 30);
    [backBtn setImage:[UIImage imageNamed:@"back_white"] forState:UIControlStateNormal];
    [self addSubview:backBtn];
    self.backBtn = backBtn;
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(navView.frame.size.width - 30 - 16, navView.frame.size.height - 44 + (44 - 30) * 0.5, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"camera_white"] forState:UIControlStateNormal];
    [self addSubview:rightBtn];
    self.rightBtn = rightBtn;
    
    UILabel *navTitleLbl = [[UILabel alloc] initWithFrame:CGRectMake(16 + 30, navView.frame.size.height - 44 + (44 - 30) * 0.5, navView.frame.size.width - (30 + 16) * 2, 30)];
    navTitleLbl.alpha = 0.0;
    navTitleLbl.text = @"朋友圈";
    navTitleLbl.textColor = [UIColor blackColor];
    navTitleLbl.font = [UIFont boldSystemFontOfSize:17];
    navTitleLbl.textAlignment = NSTextAlignmentCenter;
    [self addSubview:navTitleLbl];
    self.navTitleLbl = navTitleLbl;
}

- (void)showNavigationViewWithAlpha:(CGFloat)alpha {
    self.navView.alpha = alpha;
    self.navTitleLbl.alpha = alpha;
    if (alpha < 0.1) {
        [self.backBtn setImage:[UIImage imageNamed:@"back_white"] forState:UIControlStateNormal];
        [self.rightBtn setImage:[UIImage imageNamed:@"camera_white"] forState:UIControlStateNormal];
    } else if (alpha > 0.9) {
        [self.backBtn setImage:[UIImage imageNamed:@"back_black"] forState:UIControlStateNormal];
        [self.rightBtn setImage:[UIImage imageNamed:@"camera_black"] forState:UIControlStateNormal];
    }
}

@end
