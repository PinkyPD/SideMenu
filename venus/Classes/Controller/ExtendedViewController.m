//
//  ExtendedViewController.m
//  Nirav Modi
//
//  Created by bviadmin on 10/27/16.
//  Copyright © 2016 Brainvire. All rights reserved.
//

#import "ExtendedViewController.h"

@interface ExtendedViewController ()

@end

@implementation ExtendedViewController
@synthesize strTitle,btnBack,btnTitle;

//@synthesize viewContainer;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

#pragma mark - Status bar appearance
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}



#pragma mark - Custom NavigationBar Methods
- (IBAction)actionBack:(UIButton *)sender {    
    POP_VC;
}
@end
