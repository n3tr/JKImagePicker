//
//  JKImagePickerCell.h
//  JKImagePicker
//
//  Created by n3tr on 1/21/12.
//  Copyright (c) 2012 Simpletail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKThumbnailImageView.h"

@class JKImagePickerCell;
@protocol JKImagePickerCellDelegate <NSObject>

- (void)JKImagePickerCell:(JKImagePickerCell *)cell selectPhotoAtIndex:(NSInteger)index;

@end

@interface JKImagePickerCell : UITableViewCell <JKThumbnailImageViewDelegate>
{
    id<JKImagePickerCellDelegate> delegate;
    BOOL isSelectableMode;
    NSUInteger rowNumber;
}

- (void)clearSelection;
- (void)setSelectMode:(BOOL)selectableMode;

@property (retain, nonatomic) IBOutlet JKThumbnailImageView *photo1;
@property (retain, nonatomic) IBOutlet JKThumbnailImageView *photo2;
@property (retain, nonatomic) IBOutlet JKThumbnailImageView *photo3;
@property (retain, nonatomic) IBOutlet JKThumbnailImageView *photo4;

@property (nonatomic, assign) NSUInteger rowNumber;
@property (nonatomic, assign) id<JKImagePickerCellDelegate> delegate;

@end
