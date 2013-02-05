//
//  RDGridCell.h
//  ThumbsGrid
//
//  Created by Oleksiy Ivanov on 2/6/13.
//  Copyright (c) 2013 Oleksiy Ivanov. All rights reserved.
//

#import "AQGridViewCell.h"

@class RDItem;

@interface RDGridCell : AQGridViewCell

@property(strong)RDItem*                    item;
@property(strong)UIImageView*               imageView;
@property(strong)UIActivityIndicatorView*   activityIndicator;

-(id)initWithItem:(RDItem*)item;

@end
