//
//  JKImagePickerCell.m
//  JKImagePicker
//
//  Created by n3tr on 1/21/12.
//  Copyright (c) 2012 Simpletail. All rights reserved.
//

#import "JKImagePickerCell.h"

@implementation JKImagePickerCell

@synthesize photo1;
@synthesize photo2;
@synthesize photo3;
@synthesize photo4;
@synthesize delegate;
@synthesize rowNumber;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // Initialization code
    }
    
    return self;
}

- (void)awakeFromNib
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    photo1.delegate = self;
    photo2.delegate = self;
    photo3.delegate = self;
    photo4.delegate = self;
}

- (void)clearSelection
{
    [photo1 clearSelection];
    [photo2 clearSelection];
    [photo3 clearSelection];
    [photo4 clearSelection];
}

- (void)clearHighlight
{
    [photo1 clearHighlight];
    [photo2 clearHighlight];
    [photo3 clearHighlight];
    [photo4 clearHighlight];
}


- (void)setSelectMode:(BOOL)selectableMode
{
    [photo1 setIsSelectable:selectableMode];
    [photo2 setIsSelectable:selectableMode];
    [photo3 setIsSelectable:selectableMode];
    [photo4 setIsSelectable:selectableMode];
}

- (void)thumbnailImageViewWasSelected:(JKThumbnailImageView *)thumbnailImageView
{
     NSUInteger selectedPhotoIndex = 0;
    if (thumbnailImageView == photo1) {
        selectedPhotoIndex = 0;
    } else if (thumbnailImageView == photo2) {
        selectedPhotoIndex = 1;
    } else if (thumbnailImageView == photo3) {
        selectedPhotoIndex = 2;
    } else if (thumbnailImageView == photo4) {
        selectedPhotoIndex = 3;
    }
    [delegate JKImagePickerCell:self selectPhotoAtIndex:selectedPhotoIndex];
}

- (void)dealloc {
    [photo1 release];
    [photo2 release];
    [photo3 release];
    [photo4 release];
    [super dealloc];
}


@end
