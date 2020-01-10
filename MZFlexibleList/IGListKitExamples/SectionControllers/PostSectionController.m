//
//  PostSectionController.m
//  MZFlexibleList
//
//  Created by 木木 on 2019/12/10.
//  Copyright © 2019 Mr.Z. All rights reserved.
//

#import "PostSectionController.h"
#import "PhotoCell.h"
#import "InteractiveCell.h"
#import "CommentCell.h"
#import "UserInfoCell.h"
#import "Post.h"

static NSInteger cellsBeforeComments = 3;

@implementation PostSectionController {
    Post *_post;
}

- (NSInteger)numberOfItems {
    return cellsBeforeComments + _post.comments.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    const CGFloat width = self.collectionContext.containerSize.width;
    CGFloat height = 0.0;
    if (index == 0 || index == 2) {
        height = 41.0;
    } else if (index == 1) {
        // square
        height = width;
    } else {
        height = 25.0;
    }
    return CGSizeMake(width, height);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    Class cellClass;
    if (index == 0) {
        cellClass = [UserInfoCell class];
    } else if (index == 1) {
        cellClass = [PhotoCell class];
    } else if (index == 2) {
        cellClass = [InteractiveCell class];
    } else {
        cellClass = [CommentCell class];
    }
    id cell = [self.collectionContext dequeueReusableCellOfClass:cellClass forSectionController:self atIndex:index];
    if ([cell isKindOfClass:[CommentCell class]]) {
        [(CommentCell *)cell setComment:_post.comments[index - cellsBeforeComments]];
    } else if ([cell isKindOfClass:[UserInfoCell class]]) {
        [(UserInfoCell *)cell setName:_post.username];
    }
    return cell;
}

- (void)didUpdateToObject:(id)object {
    _post = object;
}

@end
