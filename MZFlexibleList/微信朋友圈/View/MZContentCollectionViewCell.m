//
//  MZContentCollectionViewCell.m
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/6.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import "MZContentCollectionViewCell.h"
#import <SDWebImage/SDWebImage.h>

@interface MZPhotoCollectionView : UICollectionView <UICollectionViewDelegate, UICollectionViewDataSource>

// 图片地址数组
@property (nonatomic, copy) NSArray *picUrlArr;

@end

@implementation MZPhotoCollectionView

- (instancetype)initWithFrame:(CGRect)frame {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 5;
    self.backgroundColor = [UIColor whiteColor];
    self.delegate = self;
    self.dataSource = self;
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"photoCollectionViewCellId"];
    return [super initWithFrame:frame collectionViewLayout:flowLayout];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.picUrlArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoCollectionViewCellId" forIndexPath:indexPath];
    UIImageView *imageview = [[UIImageView alloc] init];
    imageview.frame = cell.bounds;
    [imageview sd_setImageWithURL:[NSURL URLWithString:self.picUrlArr[indexPath.item]]];
    [cell addSubview:imageview];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.picUrlArr.count == 1) {
        return CGSizeMake((self.bounds.size.width - 10) / 2, 180);
    }
    return CGSizeMake(([UIScreen mainScreen].bounds.size.width - 156) / 3, ([UIScreen mainScreen].bounds.size.width - 156) / 3);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // 点击事件
}

- (void)setPicUrlArr:(NSArray *)picUrlArr {
    _picUrlArr = picUrlArr;
    [self reloadData];
}

@end

@interface MZContentCollectionViewCell ()

@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UILabel *userNameLbl;
@property (nonatomic, strong) UILabel *contentLbl;
@property (nonatomic, strong) MZPhotoCollectionView *photoCollectionView;

@end

@implementation MZContentCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.avatarView];
    [self addSubview:self.userNameLbl];
    [self addSubview:self.contentLbl];
    [self addSubview:self.photoCollectionView];
}

#pragma -- lazy
- (UIImageView *)avatarView {
    if (!_avatarView) {
        _avatarView = [[UIImageView alloc] init];
        _avatarView.frame = CGRectMake(10, 10, 50, 50);
        _avatarView.contentMode = UIViewContentModeScaleAspectFill;
        _avatarView.layer.cornerRadius = 10;
        _avatarView.layer.masksToBounds = YES;
    }
    return _avatarView;
}

- (UILabel *)userNameLbl {
    if (!_userNameLbl) {
        _userNameLbl = [[UILabel alloc] init];
        _userNameLbl.frame = CGRectMake(CGRectGetMaxX(self.avatarView.frame) + 10, CGRectGetMinY(self.avatarView.frame), self.bounds.size.width - CGRectGetMaxX(self.avatarView.frame) - 10, 20);
        _userNameLbl.textColor = [UIColor blueColor];
        _userNameLbl.font = [UIFont systemFontOfSize:16];
        _userNameLbl.textAlignment = NSTextAlignmentLeft;
    }
    return _userNameLbl;
}

- (UILabel *)contentLbl {
    if (!_contentLbl) {
        _contentLbl = [[UILabel alloc] init];
        _contentLbl.frame = CGRectMake(CGRectGetMaxX(self.avatarView.frame) + 10, CGRectGetMaxY(self.userNameLbl.frame) + 10, self.bounds.size.width - CGRectGetMaxX(self.avatarView.frame) - 10, 0);
        _contentLbl.textColor = [UIColor blackColor];
        _contentLbl.font = [UIFont systemFontOfSize:15];
        _contentLbl.textAlignment = NSTextAlignmentLeft;
        _contentLbl.numberOfLines = 0;
    }
    return _contentLbl;
}

- (MZPhotoCollectionView *)photoCollectionView {
    if (!_photoCollectionView) {
        _photoCollectionView = [[MZPhotoCollectionView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avatarView.frame) + 10, CGRectGetMaxY(self.contentLbl.frame) + 10, self.bounds.size.width - CGRectGetMaxX(self.avatarView.frame) - 20, 0)];
    }
    return _photoCollectionView;
}


- (void)bindViewModel:(MZListModel *)listModel {
    [self.avatarView sd_setImageWithURL:[NSURL URLWithString:listModel.lavatar]];
    self.userNameLbl.text = listModel.luserName;
    self.contentLbl.text = listModel.lcontent;
    self.contentLbl.frame = CGRectMake(CGRectGetMaxX(self.avatarView.frame) + 10, CGRectGetMaxY(self.userNameLbl.frame) + 10, self.bounds.size.width - CGRectGetMaxX(self.avatarView.frame) - 10, [self heightWithContent:listModel.lcontent]);
    [self.contentLbl sizeToFit];
    
    NSArray *picUrlArr = [listModel.limage componentsSeparatedByString:@","];
    self.photoCollectionView.picUrlArr = picUrlArr;
    self.photoCollectionView.frame = CGRectMake(CGRectGetMaxX(self.avatarView.frame) + 10, CGRectGetMaxY(self.contentLbl.frame) + 10, self.bounds.size.width - CGRectGetMaxX(self.avatarView.frame) - 20, [self photoCollectionViewHeight:picUrlArr.count]);
}

- (CGFloat)photoCollectionViewHeight:(NSInteger)picCount {
    CGFloat verticalSpace = 10;
    if (picCount == 1) {
        return 180;
    } else if (picCount <= 3) {
        return ([UIScreen mainScreen].bounds.size.width - 156) / 3 + 2 * verticalSpace;
    } else if (picCount <= 6) {
        return 2 * ([UIScreen mainScreen].bounds.size.width - 156) / 3 + 3 * verticalSpace;
    } else  {
        return 3 * ([UIScreen mainScreen].bounds.size.width - 156) / 3 + 2 * verticalSpace;
    }
}

- (CGFloat)heightWithContent:(NSString *)content {
    if (!content || content.length == 0) {
        return 0.0;
    }
    CGSize size = CGSizeMake(self.contentLbl.bounds.size.width, CGFLOAT_MAX);
    CGRect rect = [content boundingRectWithSize:size options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.contentLbl.font} context:nil];
    return ceil(rect.size.height) + self.contentLbl.font.ascender + self.contentLbl.font.descender;
}

@end
