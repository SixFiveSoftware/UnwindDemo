//
//  SFSWeighInDetailViewController.h
//  UnwindDemo
//
//  Created by BJ Miller on 4/25/14.
//  Copyright (c) 2014 Six Five Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SFSWeightInfo;
@class SFSWeighInDetailViewController;

@protocol SFSWeighInInfoDelegate <NSObject>

@optional

- (void)weighInDetailViewController:(SFSWeighInDetailViewController *)vc didUpdateWeighInInfo:(SFSWeightInfo *)weighInInfo;

@end


@interface SFSWeighInDetailViewController : UIViewController

- (void)setWeighInInfo:(SFSWeightInfo *)weighInInfo;

@property (weak, nonatomic) id<SFSWeighInInfoDelegate> delegate;

@end
