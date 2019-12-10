//
//  PersonSectionController.m
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/10.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import "PersonSectionController.h"
#import "PersonCell.h"
#import "PersonModel.h"

@implementation PersonSectionController {
    PersonModel *_person;
}

#pragma mark -- IGListSectionController Overrides
- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    const CGFloat width = self.collectionContext.containerSize.width;
    const CGFloat height = 74.0;
    return CGSizeMake(width, height);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    const Class cellClass = [PersonCell class];
    PersonCell *cell = (PersonCell *)[self.collectionContext dequeueReusableCellOfClass:cellClass forSectionController:self atIndex:index];
    cell.person = _person;
    return cell;
}

- (void)didUpdateToObject:(id)object {
    _person = (PersonModel *)object;
}

@end
