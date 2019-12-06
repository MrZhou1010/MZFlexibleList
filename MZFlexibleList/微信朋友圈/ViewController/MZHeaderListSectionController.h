//
//  MZHeaderListSectionController.h
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/6.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import <IGListKit/IGListKit.h>
#import "MZListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MZHeaderListSectionController : IGListSectionController

@property (nonatomic, strong) MZListModel *listModel;

@end

NS_ASSUME_NONNULL_END
