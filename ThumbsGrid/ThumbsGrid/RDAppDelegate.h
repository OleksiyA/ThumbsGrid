//
//  RDAppDelegate.h
//  ThumbsGrid
//
//  Created by Oleksiy Ivanov on 2/5/13.
//  Copyright (c) 2013 Oleksiy Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RDAppController;

@interface RDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic)UIWindow*  window;
@property (strong)RDAppController*      appController;

@end
