//
//  PersonCell.h
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/11.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PersonModel;

@interface PersonCell : UICollectionViewCell

@property (nonatomic, copy) PersonModel *person;

@end

NS_ASSUME_NONNULL_END
