//
//  SFSWeighInsTableViewController.m
//  UnwindDemo
//
//  Created by BJ Miller on 4/25/14.
//  Copyright (c) 2014 Six Five Software, LLC. All rights reserved.
//

#import "SFSWeighInsTableViewController.h"
#import "SFSWeightInfo.h"
#import "SFSWeighInDetailViewController.h"

@interface SFSWeighInsTableViewController () <SFSWeighInInfoDelegate>
@property (nonatomic, strong) NSMutableArray *weighIns;
@end

@implementation SFSWeighInsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self populateSomeWeighIns];
}

- (void)populateSomeWeighIns
{
    self.weighIns = [NSMutableArray array];
    
    SFSWeightInfo *weighIn1 = [SFSWeightInfo new];
    weighIn1.idNumber = 0;
    weighIn1.name = @"Bobby";
    weighIn1.weight = @(200);
    weighIn1.date = [NSDate date];
    
    SFSWeightInfo *weighIn2 = [SFSWeightInfo new];
    weighIn2.idNumber = 1;
    weighIn2.name = @"Susie";
    weighIn2.weight = @(140);
    weighIn2.date = [NSDate date];
    
    SFSWeightInfo *weighIn3 = [SFSWeightInfo new];
    weighIn3.idNumber = 2;
    weighIn3.name = @"Napoleon Dynamite";
    weighIn3.weight = @(125);
    weighIn3.date = [NSDate date];
    
    [self.weighIns addObject:weighIn1];
    [self.weighIns addObject:weighIn2];
    [self.weighIns addObject:weighIn3];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.weighIns count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    SFSWeightInfo *weightInfo = self.weighIns[indexPath.row];
    
    cell.textLabel.text = weightInfo.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ lbs on %@",
                                 weightInfo.weight,
                                 [weightInfo friendlyDate]];
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UITableViewCell *cell = (UITableViewCell *)sender;
    NSUInteger cellIndex = [self.tableView indexPathForCell:cell].row;
    SFSWeightInfo *weighInInfo = self.weighIns[cellIndex];
    
    SFSWeighInDetailViewController *detailVC = segue.destinationViewController;
    [detailVC setDelegate:self];
    [detailVC setWeighInInfo:weighInInfo];
}

#pragma mark - SFSWeighInInfoDelegate methods

- (void)weighInDetailViewController:(SFSWeighInDetailViewController *)vc didUpdateWeighInInfo:(SFSWeightInfo *)weighInInfo
{
    [self.weighIns replaceObjectAtIndex:weighInInfo.idNumber withObject:weighInInfo];
    
    [self.tableView reloadData];
}

@end
