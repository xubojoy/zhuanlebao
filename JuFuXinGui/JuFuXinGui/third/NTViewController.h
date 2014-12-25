//
//  NTViewController.h
//  tabbarDemo
//
//  Created by MD101 on 14-10-8.
//  Copyright (c) 2014年 TabBarDemo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSTimer+Addition.h"
@interface NTViewController : UITabBarController
@property (nonatomic , strong) NSTimer *animationTimer;
@property (nonatomic, assign) BOOL tabBarHidden;

- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated;
+(NTViewController *)sharedController;
@end
