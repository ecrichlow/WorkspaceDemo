//
//  ViewController.m
//  TableViewDemo
//
//  Created by Eric Crichlow on 4/27/19.
//  Copyright © 2019 Infusions of Grandeur. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

	NSInteger lastSelectedNumber = 0;
	int totalCells = 0;

- (void) viewDidLoad
{
	[super viewDidLoad];
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"plainCell"];
}

- (NSString *) description
{
	return ([NSString stringWithFormat:@"Counter View Controller. Last selected row was: %ld,    total cells allocated: %d\n", (long)lastSelectedNumber, totalCells]);
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
	return (1);
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return (501);
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = nil;
	
	cell = [self.tableView dequeueReusableCellWithIdentifier:@"plainCell" forIndexPath:indexPath];
	cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
	if (cell.textLabel.tag == 0)
	{
		cell.textLabel.tag = totalCells;
		totalCells++;
	}
	printf ("Row: %ld     Tag: %ld     TotalCells: %d\n", indexPath.row, cell.textLabel.tag, totalCells);
	return (cell);
}

- (void) tableView:(UITableView *)tableView prefetchRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
{
	for (int index=0;index<indexPaths.count;index++)
	{
		NSIndexPath *nextPath = indexPaths[index];
		printf ("Prefetch row: %ld\n", nextPath.row);
	}
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

	lastSelectedNumber = indexPath.row;
	[delegate randomPublicFunction];
}
@end
