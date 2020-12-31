//
//  MZTimeCollectionViewCell.h
//  MZFlexibleList
//
//  Created by Mr.Z on 2020/1/9.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MZTimeCollectionViewCell : UICollectionViewCell <IGListBindable>

- (void)bindViewModel:(MZListModel *)listModel;

@end

NS_ASSUME_NONNULL_END
