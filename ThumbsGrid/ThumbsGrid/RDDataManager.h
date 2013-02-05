//
//  RDDataManager.h
//  ThumbsGrid
//
//  Created by Oleksiy Ivanov on 2/5/13.
//  Copyright (c) 2013 Oleksiy Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RDItem;

@interface RDDataManager : NSObject

@property(strong)NSArray*               itemsUrls;
@property(strong)NSMutableArray*        cachedItemsObjects;

-(int)numberOfItems;
-(RDItem*)itemAtIndex:(int)index;

@end
