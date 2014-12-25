//
//  MyNBTabController.h
//  NB2
//
//  Created by kohn on 13-11-16.
//  Copyright (c) 2013年 Kohn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NTViewController.h"
#import "CycleScrollView.h"
@interface RecomIndexViewController : UIViewController
@property (nonatomic ,weak) NTViewController * delegate;
@property (nonatomic , retain) CycleScrollView *mainScorllView;
@end
