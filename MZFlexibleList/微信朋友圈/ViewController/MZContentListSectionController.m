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
    if (self.listModel.luserName && ![self.listModel.luserName isEqualToString:@""]) {
        return 1;
    }
    return 0;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, [self caculateHeightForItem]);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    MZContentCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[MZContentCollectionViewCell class] forSectionController:self atIndex:index];
    [cell bindViewModel:self.listModel];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.listModel = object;
}

- (CGFloat)caculateHeightForItem {
    CGFloat itemHeight = 0.0;
    CGFloat margin = 5.0;
    CGFloat userNameHeight = 20.0;
    itemHeight += userNameHeight + margin * 2.0;
    CGFloat contentHeight = [self heightWithContent:self.listModel.lcontent];
    itemHeight += contentHeight + margin;
    if (self.listModel.limage && ![self.listModel.limage isEqualToString:@""]) {
        CGFloat pictrueHeight = [self heightWithPictrue:[self.listModel.limage componentsSeparatedByString:@","]];
        itemHeight += pictrueHeight + margin;
    }
    return itemHeight;
}

- (CGFloat)heightWithContent:(NSString *)content {
    if (!content || content.length == 0) {
        return 0.0;
    }
    UIFont *font = [UIFont systemFontOfSize:15];
    CGSize size = CGSizeMake(self.collectionContext.containerSize.width - 80.0, CGFLOAT_MAX);
    CGRect rect = [content boundingRectWithSize:size options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil];
    return ceil(rect.size.height) + font.ascender + font.descender;
}

- (CGFloat)heightWithPictrue:(NSArray *)picArr {
    CGFloat verticalSpace = 5.0;
    if (picArr.count == 0) {
        return 0.0;
    } else if (picArr.count == 1) {
        return 180.0;
    } else if (picArr.count <= 3) {
        return (self.collectionContext.containerSize.width - 156.0) / 3.0;
    } else if (picArr.count <= 6) {
        return 2.0 * (self.collectionContext.containerSize.width - 156.0) / 3.0 + verticalSpace;
    } else {
        return 3.0 * (self.collectionContext.containerSize.width - 156.0) / 3.0 + 3.0 * verticalSpace;
    }
}

@end
