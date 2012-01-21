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

- (void)clearSelection
{
    
}

- (void)dealloc {

    [photo1 release];
    [photo2 release];
    [photo3 release];
    [photo4 release];
    [super dealloc];
}
@end
