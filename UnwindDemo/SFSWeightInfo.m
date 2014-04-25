//
//  SFSWeightInfo.m
//  UnwindDemo
//
//  Created by BJ Miller on 4/25/14.
//  Copyright (c) 2014 Six Five Software, LLC. All rights reserved.
//

#import "SFSWeightInfo.h"

@implementation SFSWeightInfo

- (NSString *)friendlyDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    NSString *result = [dateFormatter stringFromDate:self.date];
    return result;
}

@end
