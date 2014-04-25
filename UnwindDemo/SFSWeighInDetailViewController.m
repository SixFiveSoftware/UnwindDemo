//
//  SFSWeighInDetailViewController.m
//  UnwindDemo
//
//  Created by BJ Miller on 4/25/14.
//  Copyright (c) 2014 Six Five Software, LLC. All rights reserved.
//

#import "SFSWeighInDetailViewController.h"
#import "SFSWeightInfo.h"

@interface SFSWeighInDetailViewController ()
@property (nonatomic, strong) SFSWeightInfo *weighInInfo;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *weightField;
@property (weak, nonatomic) IBOutlet UILabel *dateField;
@end

@implementation SFSWeighInDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self fillUIWithData];
}

- (void)fillUIWithData
{
    self.nameField.text = self.weighInInfo.name;
    self.weightField.text = [NSString stringWithFormat:@"%@", self.weighInInfo.weight];
    self.dateField.text = [self.weighInInfo friendlyDate];
}

- (void)setWeighInInfo:(SFSWeightInfo *)weighInInfo
{
    _weighInInfo = weighInInfo;
}

- (IBAction)save:(id)sender
{
    self.weighInInfo.name = self.nameField.text;
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    self.weighInInfo.weight = [formatter numberFromString:self.weightField.text];
    
    if ([self.delegate respondsToSelector:@selector(weighInDetailViewController:didUpdateWeighInInfo:)]) {
        [self.delegate weighInDetailViewController:self didUpdateWeighInInfo:self.weighInInfo];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
