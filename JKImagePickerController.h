//
//  JKImagePickerController.h
//  JKImagePicker
//
//  Created by n3tr on 1/21/12.
//  Copyright (c) 2012 Simpletail. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JKImagePickerCell.h"

@interface JKImagePickerController : UITableViewController <JKImagePickerCellDelegate>
{
    NSInteger lastSelectedRow;
    NSMutableArray *selectedIndexes;
}
@property (retain, nonatomic) IBOutlet JKImagePickerCell *tmpCell;

@property (nonatomic, retain) NSMutableArray *selectedIndexes;

@end
