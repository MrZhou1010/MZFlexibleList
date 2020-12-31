//
//  MZTimeCollectionViewCell.m
//  MZFlexibleList
//
//  Created by Mr.Z on 2020/1/9.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

#import "MZTimeCollectionViewCell.h"

@interface MZTimeCollectionViewCell ()

@property (nonatomic, strong) UILabel *timeLbl;
@property (nonatomic, strong) UIButton *moreBtn;
@property (nonatomic, strong) CALayer *separator;

@end

@implementation MZTimeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self.contentView addSubview:self.timeLbl];
    [self.contentView addSubview:self.moreBtn];
    [self.contentView.layer addSublayer:self.separator];
}

#pragma mark - lazy
- (UILabel *)timeLbl {
    if (!_timeLbl) {
        _timeLbl = [[UILabel alloc] init];
        _timeLbl.frame = CGRectMake(70.0, (self.bounds.size.height - 20.0) * 0.5, self.bounds.size.width - 120.0, 20.0);
        _timeLbl.textColor = [UIColor lightGrayColor];
        _timeLbl.font = [UIFont systemFontOfSize:14];
        _timeLbl.textAlignment = NSTextAlignmentLeft;
    }
    return _timeLbl;
}

- (UIButton *)moreBtn {
    if (!_moreBtn) {
        _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _moreBtn.frame = CGRectMake(self.bounds.size.width - 40.0, (self.bounds.size.height - 20.0) * 0.5, 30.0, 20.0);
        _moreBtn.backgroundColor = [UIColor lightGrayColor];
        _moreBtn.titleLabel.font = [UIFont boldSystemFontOfSize:30];
        [_moreBtn setTitle:@"··" forState:UIControlStateNormal];
        [_moreBtn addTarget:self action:@selector(moreBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        _moreBtn.layer.cornerRadius = 3.0;
        _moreBtn.titleEdgeInsets = UIEdgeInsetsMake(-6, 0, 0, 0);
    }
    return _moreBtn;
}

- (CALayer *)separator {
    if (!_separator) {
        _separator = [CALayer layer];
        _separator.frame = CGRectMake(0, self.bounds.size.height - (1.0 / [UIScreen mainScreen].scale), self.bounds.size.width, 1.0 / [UIScreen mainScreen].scale);
        _separator.backgroundColor = [UIColor lightGrayColor].CGColor;
    }
    return _separator;
}

- (void)bindViewModel:(MZListModel *)listModel {
    self.timeLbl.text = listModel.publicTime;
}

- (void)moreBtnAction:(id)sender {
    
}

@end
