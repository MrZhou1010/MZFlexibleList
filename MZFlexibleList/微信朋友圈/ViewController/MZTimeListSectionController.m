//
//  MZTimeListSectionController.m
//  MZFlexibleList
//
//  Created by Mr.Z on 2020/1/9.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

#import "MZTimeListSectionController.h"
#import "MZTimeCollectionViewCell.h"

@implementation MZTimeListSectionController

- (NSInteger)numberOfItems {
    if (self.listModel.publicTime && ![self.listModel.publicTime isEqualToString:@""]) {
        return 1;
    }
    return 0;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 40.0);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    MZTimeCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[MZTimeCollectionViewCell class] forSectionController:self atIndex:index];
    [cell bindViewModel:self.listModel];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.listModel = object;
}

@end
