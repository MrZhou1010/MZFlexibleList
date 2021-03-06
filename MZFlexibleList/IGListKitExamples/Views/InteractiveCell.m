//
//  InteractiveCell.m
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import "InteractiveCell.h"

@interface InteractiveCell ()

@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) CALayer *separator;

@end

@implementation InteractiveCell

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
    UIColor *buttonTitleColor = [UIColor colorWithRed:28.0 / 255.0 green:30.0 / 255.0 blue:28.0 / 255.0 alpha:1.0];
    UIFont *titleFont = [UIFont systemFontOfSize:12.0];
    self.likeButton = [[UIButton alloc] init];
    [self.likeButton setTitle:@"Like" forState:UIControlStateNormal];
    [self.likeButton setTitleColor:buttonTitleColor forState:UIControlStateNormal];
    [self.likeButton.titleLabel setFont:titleFont];
    [self.likeButton sizeToFit];
    [self.contentView addSubview:self.likeButton];
    self.commentButton = [[UIButton alloc] init];
    [self.commentButton setTitle:@"Comment" forState:UIControlStateNormal];
    [self.commentButton setTitleColor:buttonTitleColor forState:UIControlStateNormal];
    [self.commentButton.titleLabel setFont:titleFont];
    [self.commentButton sizeToFit];
    [self.contentView addSubview:self.commentButton];
    self.shareButton = [[UIButton alloc] init];
    [self.shareButton setTitle:@"Share" forState:UIControlStateNormal];
    [self.shareButton setTitleColor:buttonTitleColor forState:UIControlStateNormal];
    [self.shareButton.titleLabel setFont:titleFont];
    [self.shareButton sizeToFit];
    [self.contentView addSubview:self.shareButton];
    self.separator = [[CALayer alloc] init];
    self.separator.backgroundColor = [UIColor colorWithRed:200.0 / 255.0 green:199.0 / 255.0 blue:204.0 / 255.0 alpha:1.0].CGColor;
    [self.contentView.layer addSublayer:self.separator];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect bounds = self.contentView.bounds;
    CGFloat leftPadding = 8.0;
    self.likeButton.frame = CGRectMake(leftPadding, 0, CGRectGetWidth(self.likeButton.frame), bounds.size.height);
    self.commentButton.frame = CGRectMake(leftPadding + CGRectGetMaxX(self.likeButton.frame), 0, CGRectGetWidth(self.commentButton.frame), bounds.size.height);
    self.shareButton.frame = CGRectMake(leftPadding + CGRectGetMaxX(self.commentButton.frame), 0, CGRectGetWidth(self.shareButton.frame), bounds.size.height);
    CGFloat height = 0.5;
    self.separator.frame = CGRectMake(leftPadding, bounds.size.height - height, bounds.size.width - leftPadding, height);
}

@end
