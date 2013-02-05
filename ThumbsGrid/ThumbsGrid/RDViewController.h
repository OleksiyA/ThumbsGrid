//
//  RDViewController.h
//  ThumbsGrid
//
//  Created by Oleksiy Ivanov on 2/5/13.
//  Copyright (c) 2013 Oleksiy Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AQGridView.h"

@class RDDataManager;

@interface RDViewController : UIViewController<AQGridViewDelegate, AQGridViewDataSource>

@property (weak, nonatomic) IBOutlet AQGridView *gridView;

@end
