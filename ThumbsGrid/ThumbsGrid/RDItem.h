//
//  RDItem.h
//  ThumbsGrid
//
//  Created by Oleksiy Ivanov on 2/5/13.
//  Copyright (c) 2013 Oleksiy Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDItem : NSObject

@property(strong)NSString*          itemURLString;
@property(strong)UIImage*           cachedImage;
@property BOOL                      loading;

-(id)initWitUrlString:(NSString*)urlString;

@end
