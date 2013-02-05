//
//  RDDataManager.m
//  ThumbsGrid
//
//  Created by Oleksiy Ivanov on 2/5/13.
//  Copyright (c) 2013 Oleksiy Ivanov. All rights reserved.
//

#import "RDDataManager.h"
#import "RDItem.h"

#define K_MAX_NUMBER_OF_CACHED_ITEMS        (10)

@implementation RDDataManager

#pragma mark Internal interface
-(NSString*)pathToPlistFile
{
    NSString* pathToPlist = [[NSBundle mainBundle]pathForResource:@"ImagesList.plist" ofType:nil];
    
    return pathToPlist;
}

-(void)loadListOfUrls
{
    NSString* pathToPlistFile = [self pathToPlistFile];
    
    NSArray* array = [NSArray arrayWithContentsOfFile:pathToPlistFile];
    
    self.itemsUrls = array;
    
    NSLog(@"Loaded from built-in plist URLs for items [%@].",self.itemsUrls);
}

-(void)addCachedItem:(RDItem*)item
{
    if(!item)
    {
        return;
    }
    
    if([self.cachedItemsObjects containsObject:item])
    {
        return;
    }
    
    [self.cachedItemsObjects addObject:item];
    
    if([self.cachedItemsObjects count]>K_MAX_NUMBER_OF_CACHED_ITEMS)
    {
        [self.cachedItemsObjects removeObjectAtIndex:0];
    }
}

-(RDItem*)cachedItemForUrlString:(NSString*)urlString
{
    for(RDItem* item in self.cachedItemsObjects)
    {
        if([item.itemURLString isEqualToString:urlString])
        {
            return item;
        }
    }
    
    return nil;
}

#pragma mark Allocation and Deallocation
-(id)init
{
    self = [super init];
    
    self.cachedItemsObjects = [[NSMutableArray alloc]init];
    
    [self loadListOfUrls];
    
    return self;
}

#pragma mark Public interface
-(int)numberOfItems
{
    int cnt = [self.itemsUrls count];
    return cnt;
}

-(RDItem*)itemAtIndex:(int)index
{
    if(index<0 || index>=[self.itemsUrls count])
    {
        return nil;
    }
    
    NSString* urlStringForItem = [self.itemsUrls objectAtIndex:index];
    
    RDItem* item = [self cachedItemForUrlString:urlStringForItem];
    
    if(item)
    {
        return item;
    }
    
    item = [[RDItem alloc]initWitUrlString:urlStringForItem];
    
    [self addCachedItem:item];
    
    return item;
}

@end
