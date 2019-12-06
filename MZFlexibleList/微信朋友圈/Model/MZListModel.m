//
//  MZListModel.m
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/5.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import "MZListModel.h"

@implementation MZListModel

- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {
    return [self isEqual:object];
}

@end
