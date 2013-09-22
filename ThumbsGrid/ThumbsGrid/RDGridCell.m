//
//  RDGridCell.m
//  ThumbsGrid
//
//  Created by Oleksiy Ivanov on 2/6/13.
//  Copyright (c) 2013 Oleksiy Ivanov.
//  The MIT License (MIT).
//

#import "RDGridCell.h"
#import "RDItem.h"

@implementation RDGridCell

#pragma mark Internal interface
- (void)updateUI
{
    if (!self.item.loading) {
        self.imageView.image = self.item.cachedImage;
        
        if (self.activityIndicator) {
            [self.activityIndicator removeFromSuperview];
            self.activityIndicator = nil;
        }
        
        if (!self.imageView.image) {
            //probably error loading image
            self.imageView.image = [UIImage imageNamed:@"errorLoadingImage.png"];
        }
    } else {
        if (!self.activityIndicator) {
            self.activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            self.activityIndicator.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
            self.activityIndicator.center = CGPointMake(self.imageView.frame.size.width/2, self.imageView.frame.size.height/2);
        }
        
        if (![self.activityIndicator superview]) {
            [self.imageView addSubview:self.activityIndicator];
        }
        
        if (![self.activityIndicator isAnimating]) {
            [self.activityIndicator startAnimating];
        }
    }
}

- (void)startWatchingForItemStausChanges
{
    [self.item addObserver:self forKeyPath:@"loading" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)stopWatchingForItemStatusChanges
{
    [self.item removeObserver:self forKeyPath:@"loading"];
}

#pragma mark Allocation and Deallocation
- (instancetype)initWithItem:(RDItem *)item
{
    self = [super initWithFrame:CGRectMake(0, 0, 96, 128) reuseIdentifier:@"RDGridCell"];
    
    self.item = item;
    
    self.imageView = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, 96, 128)];
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview: self.imageView];
    
    [self updateUI];
    
    [self startWatchingForItemStausChanges];
    
    return self;
}

- (void)dealloc
{
    [self stopWatchingForItemStatusChanges];
}

#pragma mark Observing values
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self updateUI];
    });
}

@end
