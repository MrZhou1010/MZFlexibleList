//
//  CommentCell.m
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import "CommentCell.h"

@interface CommentCell ()

@property (nonatomic, strong) UILabel *commentLabel;

@end

@implementation CommentCell

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
    self.commentLabel = [[UILabel alloc] init];
    self.commentLabel.textColor = [UIColor colorWithRed:0.59 green:0.59 blue:0.57 alpha:1.0];
    self.commentLabel.textAlignment = NSTextAlignmentLeft;
    self.commentLabel.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:self.commentLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat left = 8.0;
    CGRect bounds = self.contentView.bounds;
    self.commentLabel.frame = CGRectMake(left, 0, bounds.size.width - left * 2.0, bounds.size.height);
}

- (void)setComment:(NSString *)comment {
    _comment = [comment copy];
    self.commentLabel.text = comment;
}

@end
