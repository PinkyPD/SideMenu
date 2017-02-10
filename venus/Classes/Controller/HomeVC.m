//
//  HomeVC.m
//  venus
//
//  Created by bviadmin on 06/02/17.
//  Copyright © 2017 Brainvire. All rights reserved.
//

#import "HomeVC.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)actionMenuTapped:(id)sender{
    //MY_ALERT(@"actionMenuTapped");
    [APP_DELEGATE toggleMenu];

}

@end
