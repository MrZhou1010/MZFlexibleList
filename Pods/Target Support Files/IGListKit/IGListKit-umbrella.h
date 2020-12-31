#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import <IGListKit/IGListAdapter.h>
#import <IGListKit/IGListAdapterDataSource.h>
#import <IGListKit/IGListAdapterDelegate.h>
#import <IGListKit/IGListAdapterMoveDelegate.h>
#import <IGListKit/IGListAdapterPerformanceDelegate.h>
#import <IGListKit/IGListAdapterUpdateListener.h>
#import <IGListKit/IGListAdapterUpdater.h>
#import <IGListKit/IGListAdapterUpdaterDelegate.h>
#import <IGListKit/IGListBatchContext.h>
#import <IGListKit/IGListBindable.h>
#import <IGListKit/IGListBindingSectionController.h>
#import <IGListKit/IGListBindingSectionControllerDataSource.h>
#import <IGListKit/IGListBindingSectionControllerSelectionDelegate.h>
#import <IGListKit/IGListCollectionContext.h>
#import <IGListKit/IGListCollectionScrollingTraits.h>
#import <IGListKit/IGListCollectionView.h>
#import <IGListKit/IGListCollectionViewDelegateLayout.h>
#import <IGListKit/IGListCollectionViewLayout.h>
#import <IGListKit/IGListCollectionViewLayoutCompatible.h>
#import <IGListKit/IGListDisplayDelegate.h>
#import <IGListKit/IGListGenericSectionController.h>
#import <IGListKit/IGListKit.h>
#import <IGListKit/IGListReloadDataUpdater.h>
#import <IGListKit/IGListScrollDelegate.h>
#import <IGListKit/IGListSectionController.h>
#import <IGListKit/IGListSingleSectionController.h>
#import <IGListKit/IGListSupplementaryViewSource.h>
#import <IGListKit/IGListTransitionDelegate.h>
#import <IGListKit/IGListUpdatingDelegate.h>
#import <IGListKit/IGListWorkingRangeDelegate.h>

FOUNDATION_EXPORT double IGListKitVersionNumber;
FOUNDATION_EXPORT const unsigned char IGListKitVersionString[];
