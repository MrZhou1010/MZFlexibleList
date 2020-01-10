//
//  MZHeaderListSectionController.h
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/6.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import "MZListModel.h"
#import <IGListKit/IGListKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZHeaderListSectionController : IGListSectionController

@property (nonatomic, strong) MZListModel *listModel;

@end

NS_ASSUME_NONNULL_END
