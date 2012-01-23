//
//  JKThumbnailImageView.m
//  JKImagePicker
//
//  Created by n3tr on 1/22/12.
//  Copyright (c) 2012 Simpletail. All rights reserved.
//

#import "JKThumbnailImageView.h"

@interface JKThumbnailImageView ()

- (void)createHighlightImageView;
- (void)createSelectionImageView;
@end

@implementation JKThumbnailImageView

@synthesize delegate;
@synthesize isSelectable;


- (void)dealloc
{
    [highlightView release];
    [selectionView release];
    [super dealloc];
}

#pragma -
#pragma Touch Handing

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch");
    [self createHighlightImageView];
    [self addSubview:highlightView];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [delegate thumbnailImageViewWasSelected:self];
    [highlightView removeFromSuperview];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [highlightView removeFromSuperview];
}


#pragma mark -
#pragma mark Helper Methods


- (void)clearSelection
{
    [selectionView removeFromSuperview];
}

- (void)clearHighlight
{
    [highlightView removeFromSuperview];
}

- (void)createHighlightImageView
{
    if (!highlightView) {
        UIImage *thumbnailHighlight = [UIImage imageNamed:@"ThumbnailHighlight-70"];
        highlightView = [[UIImageView alloc] initWithImage:thumbnailHighlight];
        [highlightView setAlpha: 0.5];
    }
}

- (void)createSelectionImageView
{
    if (!selectionView) {
        UIImage *thumbnailSelection = [UIImage imageNamed:@"ThumbnailSelection-70"];
        selectionView = [[UIImageView alloc] initWithImage:thumbnailSelection];
        [selectionView setAlpha: 0.5];
    }
}

@end
