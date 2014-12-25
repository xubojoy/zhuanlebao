//
//  AboutUsCell.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-19.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "AboutUsCell.h"

@implementation AboutUsCell

- (void)awakeFromNib {
    // Initialization code
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 43.5, VIEW_WEIGHT, 0.5)];
    self.lineView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.lineView];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
