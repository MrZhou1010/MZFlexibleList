//
//  PersonModel.h
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/10.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListDiffKit/IGListDiffable.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonModel : NSObject <IGListDiffable, NSCopying>

@property (nonatomic, readonly, copy) NSString *firstName;
@property (nonatomic, readonly, copy) NSString *lastName;
@property (nonatomic, readonly, copy) NSString *uniqueId;

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName uniqueId:(NSString *)uniqueId NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
