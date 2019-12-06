//
//  MZHeaderListSectionController.m
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/6.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import "MZHeaderListSectionController.h"
#import "MZHeaderCollectionViewCell.h"

@implementation MZHeaderListSectionController

- (NSInteger)numberOfItems {
    if (self.listModel.headImage) {
        return 1;
    }
    return 0;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.viewController.view.frame.size.width, 400);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    MZHeaderCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[MZHeaderCollectionViewCell class] forSectionController:self atIndex:index];
    [cell bindViewModel:self.listModel];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.listModel = object;
}

@end
