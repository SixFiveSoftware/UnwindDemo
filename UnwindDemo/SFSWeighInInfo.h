//
//  SFSWeighInInfo.h
//  UnwindDemo
//
//  Created by BJ Miller on 4/25/14.
//  Copyright (c) 2014 Six Five Software, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFSWeighInInfo : NSObject

@property (nonatomic) NSInteger idNumber;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *weight;
@property (nonatomic, strong) NSDate *date;

- (NSString *)friendlyDate;

@end
