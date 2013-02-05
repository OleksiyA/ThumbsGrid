//
//  RDItem.m
//  ThumbsGrid
//
//  Created by Oleksiy Ivanov on 2/5/13.
//  Copyright (c) 2013 Oleksiy Ivanov. All rights reserved.
//

#import "RDItem.h"
#import "GTMHTTPFetcher.h"

@implementation RDItem

#pragma mark Internal interface
-(void)handleDataForItemWasDownloaded:(NSData*)data
{
    UIImage* image = [UIImage imageWithData:data];
    
    if(image.size.width<1 || image.size.height<1)
    {
        NSLog(@"Error allocating image from loaded data for Url [%@]. Data lenght [%d].",self.itemURLString,[data length]);
        
        return;
    }
    
    self.cachedImage = image;
}

-(void)startLoadingItem
{
    self.loading = YES;
    
    NSURL *url = [NSURL URLWithString:self.itemURLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    GTMHTTPFetcher* myFetcher = [GTMHTTPFetcher fetcherWithRequest:request];
    
    [myFetcher beginFetchWithCompletionHandler:^(NSData *retrievedData, NSError *error) {
        
        if (error != nil)
        {
            // status code or network error
            NSLog(@"Error downloading item data for Url [%@], error [%@].",self.itemURLString,error);
            
        }
        else
        {
            // succeeded
            [self handleDataForItemWasDownloaded:retrievedData];
        }
        
        self.loading = NO;
    }];
}

#pragma mark Allocation and Deallocation
-(id)initWitUrlString:(NSString*)urlString
{
    self = [super init];
    
    self.itemURLString = urlString;
    
    [self startLoadingItem];
    
    return self;
}

#pragma mark Public interface


@end
