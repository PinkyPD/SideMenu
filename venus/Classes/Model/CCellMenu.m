//
//  CCellMenuTableViewCell.m
//
//  Created by bviadmin on 16/01/15.
//  Copyright (c) 2015 Brainvire. All rights reserved.
//

#import "CCellMenu.h"

@implementation CCellMenu

@synthesize imgViewLeft, imgViewRight, lblTitle, lblSeparator;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
