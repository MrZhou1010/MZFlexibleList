//
//  PhotoCell.m
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import "PhotoCell.h"

@interface PhotoCell ()

@property (nonatomic, strong) UIView *view;

@end

@implementation PhotoCell

- (instancetype)init {
    if (self = [super init]) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = [UIColor colorWithRed:4.0 / 255.0 green:170.0 / 255.0 blue:166.0 / 255.0 alpha:1.0];
    [self.contentView addSubview:self.view];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.view.frame = self.contentView.frame;
}

@end
