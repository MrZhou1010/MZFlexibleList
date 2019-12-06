//
//  MZListModel.h
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/5.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit/IGListKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZListModel : NSObject<IGListDiffable>

@property (nonatomic, copy) NSString *modelId;
@property (nonatomic, copy) NSString *headImage;
@property (nonatomic, copy) NSString *headAvatar;
@property (nonatomic, copy) NSString *headUserName;
@property (nonatomic, copy) NSString *limage;
@property (nonatomic, copy) NSString *lavatar;
@property (nonatomic, copy) NSString *luserName;
@property (nonatomic, copy) NSString *lcontent;
@property (nonatomic, copy) NSString *llocation;
@property (nonatomic, copy) NSString *publicTime;

@end

NS_ASSUME_NONNULL_END
