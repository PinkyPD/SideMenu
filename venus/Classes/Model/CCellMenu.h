//
//  CCellMenuTableViewCell.h
//
//  Created by bviadmin on 16/01/15.
//  Copyright (c) 2015 Brainvire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCellMenu : UITableViewCell

@property(nonatomic, strong) IBOutlet UIImageView *imgViewLeft;
@property(nonatomic, strong) IBOutlet UIImageView *imgViewRight;
@property(nonatomic, strong) IBOutlet UILabel *lblTitle;
@property(nonatomic, strong) IBOutlet UILabel *lblSeparator;

@end
