//
//  MZLoctionListSectionController.h
//  MZFlexibleList
//
//  Created by Mr.Z on 2020/1/9.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

#import "MZListModel.h"
#import <IGListKit/IGListKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZLoctionListSectionController : IGListSectionController

@property (nonatomic, strong) MZListModel *listModel;

@end

NS_ASSUME_NONNULL_END
