//
//  MZContentListSectionController.m
//  MZFlexibleList
//
//  Created by Mr.Z on 2019/12/6.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import "MZContentListSectionController.h"
#import "MZContentCollectionViewCell.h"

@implementation MZContentListSectionController


- (NSInteger)numberOfItems {
    if (!self.listModel.luserName) {
        return 0;
    }
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.viewController.view.frame.size.width, 400);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    MZContentCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[MZContentCollectionViewCell class] forSectionController:self atIndex:index];
    [cell bindViewModel:self.listModel];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.listModel = object;
}

@end
