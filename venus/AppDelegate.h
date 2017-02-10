//
//  AppDelegate.h
//  venus
//
//  Created by Brainvire on 1/6/17.
//  Copyright © 2017 Brainvire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"
#import "HomeVC.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    
}

@property (strong, nonatomic) UIWindow *window;

//Menu
@property (strong, nonatomic) UISwipeGestureRecognizer *swipeToOpen;
@property (strong, nonatomic) UISwipeGestureRecognizer *swipeToClose;
@property (strong, nonatomic) MenuViewController *objMenuVC;

#pragma mark - Custom Methods
-(void)showHome:(NSString*)strTitle withAnimation:(BOOL)animated;
-(void)showLoginScreen;
-(void)setRootViewController:(UIViewController *)vc animated:(BOOL)animated;
-(void)enableMenuGesture;
-(void)disableMenuGesture;

#pragma mark - Menu Animation Methods
- (void)openMenu;
- (void)closeMenu;
-(void)toggleMenu;

+(BOOL) isScreenVisibleForViewController:(Class)vc;



@end

