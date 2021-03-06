//
//  MZHeaderCollectionViewCell.m
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/6.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import "MZHeaderCollectionViewCell.h"
#import <SDWebImage/SDWebImage.h>

@interface MZHeaderCollectionViewCell ()

@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UIImageView *headAvatarView;
@property (nonatomic, strong) UILabel *headUserNameLbl;

@end

@implementation MZHeaderCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self.contentView addSubview:self.headImageView];
    [self.contentView addSubview:self.headAvatarView];
    [self.contentView addSubview:self.headUserNameLbl];
}

#pragma mark - lazy
- (UIImageView *)headImageView {
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] init];
        _headImageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - 60.0);
        _headImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _headImageView;
}

- (UIImageView *)headAvatarView {
    if (!_headAvatarView) {
        _headAvatarView = [[UIImageView alloc] init];
        _headAvatarView.frame = CGRectMake(self.bounds.size.width - 96.0, self.bounds.size.height - 120.0, 80.0, 80.0);
        _headAvatarView.contentMode = UIViewContentModeScaleAspectFill;
        _headAvatarView.layer.cornerRadius = 10.0;
        _headAvatarView.layer.masksToBounds = YES;
    }
    return _headAvatarView;
}

- (UILabel *)headUserNameLbl {
    if (!_headUserNameLbl) {
        _headUserNameLbl = [[UILabel alloc] init];
        _headUserNameLbl.frame = CGRectMake(0, CGRectGetMinY(self.headAvatarView.frame), CGRectGetMinX(self.headAvatarView.frame) - 16.0, CGRectGetWidth(self.headAvatarView.frame) - 20.0);
        _headUserNameLbl.textColor = [UIColor whiteColor];
        _headUserNameLbl.font = [UIFont systemFontOfSize:16];
        _headUserNameLbl.textAlignment = NSTextAlignmentRight;
    }
    return _headUserNameLbl;
}

- (void)bindViewModel:(MZListModel *)listModel {
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:listModel.headImage]];
    [self.headAvatarView sd_setImageWithURL:[NSURL URLWithString:listModel.headAvatar]];
    self.headUserNameLbl.text = listModel.headUserName;
}

@end
