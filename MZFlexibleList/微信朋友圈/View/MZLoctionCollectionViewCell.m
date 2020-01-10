//
//  MZLoctionCollectionViewCell.m
//  MZFlexibleList
//
//  Created by Mr.Z on 2020/1/9.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

#import "MZLoctionCollectionViewCell.h"

@interface MZLoctionCollectionViewCell ()

@property (nonatomic, strong) UILabel *loctionLbl;

@end

@implementation MZLoctionCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self.contentView addSubview:self.loctionLbl];
}

#pragma mark - lazy
- (UILabel *)loctionLbl {
    if (!_loctionLbl) {
        _loctionLbl = [[UILabel alloc] init];
        _loctionLbl.frame = CGRectMake(70.0, 0, self.bounds.size.width - 10.0, 20.0);
        _loctionLbl.textColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
        _loctionLbl.font = [UIFont systemFontOfSize:14];
        _loctionLbl.textAlignment = NSTextAlignmentLeft;
    }
    return _loctionLbl;
}

- (void)bindViewModel:(MZListModel *)listModel {
    self.loctionLbl.text = listModel.llocation;
}

@end
