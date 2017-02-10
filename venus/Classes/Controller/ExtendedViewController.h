//
//  ExtendedViewController.h
//  Nirav Modi
//
//  Created by bviadmin on 10/27/16.
//  Copyright © 2016 Brainvire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExtendedViewController : UIViewController{
    
}
//@property (strong, nonatomic) IBOutlet UIView *viewContainer;
//@property (strong, nonatomic) NSString *strModuleName;


//for Common Back button
@property (strong, nonatomic) IBOutlet UIButton *btnBack;
@property (strong, nonatomic) IBOutlet UIButton *btnTitle;
@property (strong, nonatomic) NSString *strTitle;
- (IBAction)actionBack:(UIButton *)sender;

@end
