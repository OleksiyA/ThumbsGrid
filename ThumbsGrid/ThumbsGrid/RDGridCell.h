//
//  RDGridCell.h
//  ThumbsGrid
//
//  Created by Oleksiy Ivanov on 2/6/13.
//  Copyright (c) 2013 Oleksiy Ivanov.
//  The MIT License (MIT).
//

#import "AQGridViewCell.h"

@class RDItem;

@interface RDGridCell : AQGridViewCell

@property (strong) RDItem *item;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;

- (instancetype)initWithItem:(RDItem *)item;

@end
