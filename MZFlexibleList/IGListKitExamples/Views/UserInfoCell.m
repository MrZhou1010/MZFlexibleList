//
//  UserInfoCell.m
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import "UserInfoCell.h"

@interface UserInfoCell ()

@property (nonatomic, strong) UIView *avatarView;
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation UserInfoCell

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
    self.avatarView = [[UIView alloc] init];
    self.avatarView.backgroundColor = [UIColor colorWithRed:210.0 / 255.0 green:65.0 / 255.0 blue:64.0 / 255.0 alpha:1.0];
    [self.contentView addSubview:self.avatarView];
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = [UIFont boldSystemFontOfSize:15];
    self.nameLabel.textColor = [UIColor darkTextColor];
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.nameLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect bounds = self.contentView.bounds;
    CGFloat avatarViewWidth = 25.0;
    CGFloat avatarTopSpace = (CGRectGetHeight(bounds) - avatarViewWidth) / 2.0;
    CGFloat avatarLeftSpace = 8.0;
    self.avatarView.frame = CGRectMake(avatarLeftSpace, avatarTopSpace, avatarViewWidth, avatarViewWidth);
    self.avatarView.layer.cornerRadius = MIN(CGRectGetHeight(self.avatarView.frame), CGRectGetWidth(self.avatarView.frame)) / 2.0;
    self.avatarView.layer.masksToBounds = YES;
    self.nameLabel.frame = CGRectMake(CGRectGetMaxX(self.avatarView.frame) + 8.0, CGRectGetMinY(self.avatarView.frame), CGRectGetWidth(bounds) - CGRectGetMaxX(self.avatarView.frame) - 8.0 * 2, CGRectGetHeight(self.avatarView.frame));
}

- (void)setName:(NSString *)name {
    _name = [name copy];
    self.nameLabel.text = name;
}

@end
