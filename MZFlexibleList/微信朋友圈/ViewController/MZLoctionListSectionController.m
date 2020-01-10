//
//  MZLoctionListSectionController.m
//  MZFlexibleList
//
//  Created by Mr.Z on 2020/1/9.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

#import "MZLoctionListSectionController.h"
#import "MZLoctionCollectionViewCell.h"

@implementation MZLoctionListSectionController

- (NSInteger)numberOfItems {
    if (self.listModel.llocation && ![self.listModel.llocation isEqualToString:@""]) {
        return 1;
    }
    return 0;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 20.0);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    MZLoctionCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[MZLoctionCollectionViewCell class] forSectionController:self atIndex:index];
    [cell bindViewModel:self.listModel];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.listModel = object;
}

@end
