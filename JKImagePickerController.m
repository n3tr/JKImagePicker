//
//  JKImagePickerController.m
//  JKImagePicker
//
//  Created by n3tr on 1/21/12.
//  Copyright (c) 2012 Simpletail. All rights reserved.
//

#import "JKImagePickerController.h"
#import "JKImagePickerCell.h"

@implementation JKImagePickerController
@synthesize tmpCell;
@synthesize selectedIndexes;
- (void)awakeFromNib
{
    lastSelectedRow = NSNotFound;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    selectedIndexes = [[NSMutableArray alloc] init];
}

- (void)viewDidUnload
{
    [self setTmpCell:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"JKPickerCell";
    
    JKImagePickerCell *cell = (JKImagePickerCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"JKImagePickerCell" owner:self options:nil];
        cell = tmpCell;
        tmpCell = nil;
    }
    
    cell.rowNumber = indexPath.row;
    cell.delegate = self;
    [cell setSelectMode:YES];
    
    // Configure the cell...
    NSUInteger firstPhotoInCell = indexPath.row * 4;
    NSUInteger lastPhotoInCell  = firstPhotoInCell + 4;
    
    NSUInteger currentPhotoIndex = 0;
    NSUInteger lastPhotoIndex = MIN(lastPhotoInCell, 40);
    for ( ; firstPhotoInCell + currentPhotoIndex < lastPhotoIndex ; currentPhotoIndex++) {
        
        
        NSNumber *photoIndex = [[NSNumber alloc] initWithInt:(indexPath.row * 4) + currentPhotoIndex];
        
        UIImage *thumbnail;
        switch (currentPhotoIndex) {
            case 0:
                thumbnail = [UIImage imageNamed:@"1.jpeg"];
                [cell photo1].image = thumbnail;
                
                if ([selectedIndexes containsObject:photoIndex]) {
                    [cell.photo1 makeSelected:YES];
                    
                }
                break;
            case 1:
                thumbnail = [UIImage imageNamed:@"2.jpeg"];
                [cell photo2].image = thumbnail;
                
                if ([selectedIndexes containsObject:photoIndex]) {
                    [cell.photo2 makeSelected:YES];
                    
                }
                break;
            case 2:
                thumbnail = [UIImage imageNamed:@"3.jpeg"];
                [cell photo3].image = thumbnail;
                if ([selectedIndexes containsObject:photoIndex]) {
                    [cell.photo3 makeSelected:YES];
                }else{
                    [cell.photo3 makeSelected:NO];
                }
                break;
            case 3:
                thumbnail = [UIImage imageNamed:@"4.jpeg"];
                [cell photo4].image = thumbnail;
                if ([selectedIndexes containsObject:photoIndex]) {
                    [cell.photo4 makeSelected:YES];
                }
                break;
            default:
                break;
        }
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

- (void)JKImagePickerCell:(JKImagePickerCell *)cell selectPhotoAtIndex:(NSInteger)index
{
    
    NSInteger photoIndex = (cell.rowNumber * 4) + index;
    if (![selectedIndexes containsObject:[NSNumber numberWithInteger:photoIndex]]) {
        NSLog(@"Add %d",photoIndex);
        [selectedIndexes addObject:[NSNumber numberWithInteger:photoIndex]];
    }else{
        [selectedIndexes removeObject:[NSNumber numberWithInteger:photoIndex
                                       ]];
        NSLog(@"Remove %d",photoIndex);
    }
    

}

- (void)dealloc {
    [tmpCell release];
    [super dealloc];
}
@end
