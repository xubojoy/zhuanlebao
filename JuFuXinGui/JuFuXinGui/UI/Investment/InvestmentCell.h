//
//  InvestmentCell.h
//  JuFuXinGui
//
//  Created by myStyle on 14-12-19.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    HotSale  = 0,
    SaleOver  = 1,
    WaitingSale  = 2,
} SaleState;

@interface InvestmentCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;



@end
