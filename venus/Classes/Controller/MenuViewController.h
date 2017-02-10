//
//  MenuViewController.h
//
//  Created by bviadmin on 13/01/15.
//  Copyright (c) 2015 Brainvire. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuDelegate;

@protocol MenuDelegate<NSObject>
- (void) closeMenu;
@end

@interface MenuViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    
    id <MenuDelegate> delegate;    
    
    NSMutableArray *arrayMenuOptions;
    NSMutableArray *arrayToCollapseRef;
    
    NSIndexPath *prevIndexPath;
    BOOL isAccountMenuOpen;
    
    NSString *strStoredMenuTitle;    
}

@property (nonatomic, strong) id delegate;
@property(nonatomic, strong) IBOutlet UITableView *menuTableView;
@property(nonatomic, strong) IBOutlet UIView *containerView;
@property(nonatomic, strong) IBOutlet UIView *tapGestureView;
@property(nonatomic, strong)NSString *strTitle;

-(void)updateMenuView;
-(void)closeAllOpenedMenu;
@end
