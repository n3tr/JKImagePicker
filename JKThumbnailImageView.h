//
//  JKThumbnailImageView.h
//  JKImagePicker
//
//  Created by n3tr on 1/22/12.
//  Copyright (c) 2012 Simpletail. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JKThumbnailImageView;

@protocol JKThumbnailImageViewDelegate <NSObject>

- (void)thumbnailImageViewWasSelected:(JKThumbnailImageView *)thumbnailImageView;

@end

@interface JKThumbnailImageView : UIImageView
{
    UIImageView *highlightView;
    UIImageView *selectionView;
    id<JKThumbnailImageViewDelegate> delegate;
    BOOL isSelectable;
    BOOL selected;
}

@property (nonatomic, retain) id<JKThumbnailImageViewDelegate> delegate;
@property (nonatomic, assign) BOOL isSelectable;
@property (nonatomic, assign) BOOL isSelected;

- (void)clearSelection;
- (void)clearHighlight;
- (void)makeSelected:(BOOL)selected;

@end
