//
//  RDViewController.m
//  ThumbsGrid
//
//  Created by Oleksiy Ivanov on 2/5/13.
//  Copyright (c) 2013 Oleksiy Ivanov.
//  The MIT License (MIT).
//

#import "RDViewController.h"
#import "RDDataManager.h"
#import "RDAppDelegate.h"
#import "RDAppController.h"
#import "RDDataManager.h"
#import "RDItem.h"
#import "RDGridCell.h"

@implementation RDViewController

#pragma mark Internal interface
- (RDDataManager *)dataSource
{
    RDAppDelegate *appdelegate = (RDAppDelegate *)[[UIApplication sharedApplication]delegate];
    RDDataManager *dataManager = appdelegate.appController.dataManager;
    
    return dataManager;
}

#pragma mark UIViewController methods
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.gridView.separatorStyle = AQGridViewCellSeparatorStyleSingleLine;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.gridView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [self setGridView:nil];
    [super viewDidUnload];
}

#pragma mark AQGridViewDelegate methods
- (void) gridView:(AQGridView *)gridView didSelectItemAtIndex:(NSUInteger)index
{
    NSLog(@"Item at index [%d] selected.",index);
}

#pragma mark AQGridViewDataSource methods
- (NSUInteger) numberOfItemsInGridView: (AQGridView *) gridView
{
    int cnt = [[self dataSource]numberOfItems];
    
    return cnt;
}

- (AQGridViewCell *)gridView:(AQGridView *)gridView cellForItemAtIndex:(NSUInteger)index
{
    RDItem *item = [[self dataSource]itemAtIndex:index];
    
    RDGridCell *gridCell = [[RDGridCell alloc]initWithItem:item];
    
    return gridCell;
}

@end
