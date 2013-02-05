//
//  RDAppController.m
//  ThumbsGrid
//
//  Created by Oleksiy Ivanov on 2/5/13.
//  Copyright (c) 2013 Oleksiy Ivanov. All rights reserved.
//

#import "RDAppController.h"
#import "RDDataManager.h"

@implementation RDAppController

#pragma mark Internal methods

#pragma mark Allocation and Deallocation
-(id)init
{
    self = [super init];
    
    self.dataManager = [[RDDataManager alloc]init];
    
    return self;
}

#pragma mark Public interface

@end
