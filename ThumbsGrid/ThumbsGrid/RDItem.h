//
//  RDItem.h
//  ThumbsGrid
//
//  Created by Oleksiy Ivanov on 2/5/13.
//  Copyright (c) 2013 Oleksiy Ivanov.
//  The MIT License (MIT).
//

#import <Foundation/Foundation.h>

@interface RDItem : NSObject

@property (strong) NSString *itemURLString;
@property (strong) UIImage *cachedImage;
@property BOOL loading;

- (instancetype)initWitUrlString:(NSString *)urlString;

@end
