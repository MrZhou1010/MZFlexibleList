//
//  MZNavigationView.h
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/5.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^BackBtnActionBlock)(void);

@interface MZNavigationView : UIView

@property (nonatomic, copy) BackBtnActionBlock backBtnActionBlock;

/// 动态显示导航栏
- (void)showNavigationViewWithAlpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
