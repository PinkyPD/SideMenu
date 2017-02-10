//
//  AppDelegate.m
//  venus
//
//  Created by Brainvire on 1/6/17.
//  Copyright © 2017 Brainvire. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize objMenuVC,swipeToOpen,swipeToClose;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - Custom Methods
-(void)showHome:(NSString*)strTitle withAnimation:(BOOL)animated{
    
    [APP_DELEGATE enableMenuGesture];
    
    UINavigationController *nav=(UINavigationController *)APP_DELEGATE.window.rootViewController;
    HomeVC *homeVC = MAKE_STORY_OBJ_R1(@"idHomeVC");
    //homeVC.strTitle = strTitle;
    [nav setViewControllers:@[homeVC] animated:animated];
    [APP_DELEGATE window].rootViewController = nav;
}

-(void)showLoginScreen{
    
    [APP_DELEGATE disableMenuGesture];
    
    UINavigationController *nav=(UINavigationController *)APP_DELEGATE.window.rootViewController;
    [nav popToRootViewControllerAnimated:NO];
    UIViewController *loginVC = MAKE_STORY_OBJ_R1(@"idLoginVC");
    [nav setViewControllers:@[loginVC] animated:YES];
    [APP_DELEGATE window].rootViewController = nav;
}

-(void)setRootViewController:(UIViewController *)vc animated:(BOOL)animated{
    
    [APP_DELEGATE enableMenuGesture];
    
    UINavigationController *nav=(UINavigationController *)APP_DELEGATE.window.rootViewController;
    [nav popToRootViewControllerAnimated:NO];
    [nav setViewControllers:@[vc] animated:animated];
    [APP_DELEGATE window].rootViewController = nav;
    
}

#pragma mark - Custom Left Menu Gesture
-(void)enableMenuGesture{
    UISwipeGestureRecognizer *open = [APP_DELEGATE swipeToOpen];
    UISwipeGestureRecognizer *close = [APP_DELEGATE swipeToClose];
    if(open) open.enabled = YES;
    if(close) close.enabled = YES;
}

-(void)disableMenuGesture{
    UISwipeGestureRecognizer *open = [APP_DELEGATE swipeToOpen];
    UISwipeGestureRecognizer *close = [APP_DELEGATE swipeToClose];
    //if(open)[[APP_DELEGATE window] removeGestureRecognizer:open];
    //if(close)[[APP_DELEGATE window] removeGestureRecognizer:close];
    
    if(open) open.enabled = NO;
    if(close) open.enabled = NO;
}

-(void)setMenuGesture{
    
    AppDelegate *appDel = APP_DELEGATE;
    
    appDel.swipeToOpen = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(openMenu)];
    appDel.swipeToOpen.direction = UISwipeGestureRecognizerDirectionRight;
    //[appDel.swipeToOpen setDelegate:(id<UIGestureRecognizerDelegate>)self];
    [[APP_DELEGATE window] addGestureRecognizer:appDel.swipeToOpen];
    
    
    appDel.swipeToClose = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(closeMenu)];
    appDel.swipeToClose.direction = UISwipeGestureRecognizerDirectionLeft;
    //[appDel.swipeToClose setDelegate:(id<UIGestureRecognizerDelegate>)self];
    [[APP_DELEGATE window] addGestureRecognizer:appDel.swipeToClose];
}

#pragma mark - Custom Left Menu Animation Methods
- (void)openMenu{
    
    UINavigationController *nav=(UINavigationController *)APP_DELEGATE.window.rootViewController;
    UIViewController *topVC = (UIViewController *)nav.topViewController;
    
    if(objMenuVC && objMenuVC.view.hidden == NO){
        return;
    }
    
    if(objMenuVC){
        objMenuVC.view.hidden = NO;
        objMenuVC.delegate = topVC;
    }
    else{
        objMenuVC = MAKE_STORY_OBJ_R2(@"idMenuViewController");
        objMenuVC.delegate = topVC;
        [[APP_DELEGATE window] addSubview:objMenuVC.view];
    }
    
    [objMenuVC updateMenuView];
    
    CGRect rect = objMenuVC.view.frame;
    rect.origin.x -= rect.size.width;
    objMenuVC.view.frame = rect;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect rect = objMenuVC.view.frame;
        rect.origin.x = 0;
        objMenuVC.view.frame = rect;
        
        topVC.view.alpha = 0.5;
        topVC.navigationController.navigationBar.alpha = 0.5;
        
    } completion:^(BOOL finished) {
        
    }];
}
- (void)closeMenu{
    
    if(objMenuVC)
        [objMenuVC closeAllOpenedMenu];
}

-(void)toggleMenu{
    
    if(!self.objMenuVC || self.objMenuVC.view.hidden == YES){
        [self openMenu];
    }
    else{
        //[self closeMenu];
        [objMenuVC closeAllOpenedMenu];
    }
}

+(BOOL) isScreenVisibleForViewController:(Class)vcClass{
    
    UINavigationController *nav=(UINavigationController *)APP_DELEGATE.window.rootViewController;
    
    if([nav.visibleViewController isKindOfClass:vcClass])
        return YES;
    return NO;
}

@end
