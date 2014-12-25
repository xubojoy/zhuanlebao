//
//  InvestmentCell.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-19.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "InvestmentCell.h"

@implementation InvestmentCell

- (void)awakeFromNib {
    // Initialization code
    self.statusLabel.frame = CGRectMake(VIEW_WEIGHT-20, 4, 20, 33);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
