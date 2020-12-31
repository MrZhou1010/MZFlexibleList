//
//  Post.h
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/10.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListDiffKit/IGListDiffable.h>

NS_ASSUME_NONNULL_BEGIN

@interface Post : NSObject <IGListDiffable>

@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, copy, readonly) NSArray<NSString *> *comments;

- (instancetype)initWithUsername:(NSString *)username comments:(NSArray<NSString *> *)comments NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
