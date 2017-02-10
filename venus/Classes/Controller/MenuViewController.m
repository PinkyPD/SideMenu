//
//  MenuViewController.m
//  Right Verify
//
//  Created by bviadmin on 13/01/15.
//  Copyright (c) 2015 Brainvire. All rights reserved.
//

#import "MenuViewController.h"
#import "CCellMenu.h"
#import "CCellSubMenu.h"

#import "LoginVC.h"


#define DELAY_TIME 0.5

//Menu List Name
#define k_Menu_Home                 @"Home"
#define k_Menu_Search               @"Search"
#define k_Menu_PDS                  @"PDS"
#define k_Menu_LookBid              @"Look & Bid"
#define k_Menu_Forthcoming          @"Forthcoming"
#define k_Menu_Exhibition           @"Exhibition"
#define k_Menu_MySelection          @"My Selection"
#define k_Menu_ConfirmedGoods       @"Confirmed Goods"
#define k_Menu_WishList             @"Wish List"
#define k_Menu_MyBids               @"My Bids"
#define k_Menu_Consignment          @"Consignment"
#define k_Menu_Reservation          @"Reservation"
#define k_Menu_InHouse_viewing      @"In-House viewing"
#define k_Menu_MyProfile            @"My Profile"
#define k_Menu_MyDetails            @"My Details"
#define k_Menu_ChangePassword       @"Change Password"
#define k_Menu_ManageNotification   @"Manage Notification"
#define k_Menu_BusinessSummary      @"Business Summary"
#define k_Menu_Feedback             @"Feedback"
#define k_Menu_MyCustomization      @"My Customization"
#define k_Menu_Sub_Search           @"Search"
#define k_Menu_Result               @"Result"
#define k_Menu_OtherPreferences     @"Other Preferences"
#define k_Menu_WritetoVenus         @"Write to Venus"
#define k_Menu_HowToRemit           @"How To Remit"
#define k_Menu_ShippingExpense      @"Shipping Expense"
#define k_Menu_Logout               @"Logout"

//Menu Key
#define k_Level                     @"k_Level"
#define k_Title                     @"k_Title"
#define k_HasSubMenu                @"k_HasSubMenu"
#define k_IsOpen                    @"k_IsOpen"
#define k_ImageName                 @"k_ImageName"
#define k_SubMenu                   @"k_SubMenu"

@interface MenuViewController ()

@end

@implementation MenuViewController

@synthesize delegate;
@synthesize menuTableView, containerView, tapGestureView, strTitle;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeAllOpenedMenu)];
    [self.tapGestureView addGestureRecognizer:tap];
    
    [self prepareMenu];
    //[self performSelector:@selector(updateMenuView) withObject:nil afterDelay:0.5];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Update Menu Methods
-(void)updateMenuView{
    
    strStoredMenuTitle = @"";
    [menuTableView reloadData];
}

#pragma mark - TableView Delegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == menuTableView)
        return arrayMenuOptions.count;
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(tableView == menuTableView)
        return IS_IPAD ? 72.0 : 40.0;
    
    return 0.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == menuTableView){
        
        NSDictionary *d=[arrayMenuOptions objectAtIndex:indexPath.row];
        
        if([[d objectForKey:k_Level] isEqualToString:@"0"]){ //Parent Menu
            
            static NSString *id_Cell_Menu = @"Cell_Menu";
            CCellMenu *cell = (CCellMenu *)[menuTableView dequeueReusableCellWithIdentifier:id_Cell_Menu];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            cell.lblTitle.text = [NSString stringWithFormat:@"%@",[d valueForKey:k_Title]];
            cell.imgViewRight.hidden = [[d objectForKey:k_HasSubMenu] isEqualToString:@"1"] ? NO : YES;
            
            cell.imgViewLeft.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", [arrayMenuOptions[indexPath.row] valueForKey:k_ImageName]]];
            
            //For Rightside Image
            if ([[d objectForKey:k_IsOpen] isEqualToString:@"0"]) {
                cell.imgViewRight.image = [UIImage imageNamed:@"plus"];
                cell.lblTitle.font = kFont_Menu_Regular;
            }
            else{
                cell.imgViewRight.image = [UIImage imageNamed:@"minus"];
                cell.lblTitle.font = kFont_Menu_Bold;
            }
            
            
            if([indexPath isEqual:prevIndexPath] || [cell.lblTitle.text isEqualToString:strStoredMenuTitle]){ //set for selected cell
                
                prevIndexPath = indexPath; //For assigning previousIndexPath from stored title
                cell.backgroundColor = COLOR_NAV_SELECTED;
            }
            else{ //set for default
                cell.backgroundColor = [UIColor clearColor];
            }
            
            return cell;
        }
        else{ // SubMenu
            
            static NSString *id_Cell_SubMenu = @"Cell_SubMenu";
            CCellSubMenu *cell = (CCellSubMenu *)[menuTableView dequeueReusableCellWithIdentifier:id_Cell_SubMenu];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            cell.lblTitle.text = [NSString stringWithFormat:@"%@",[d valueForKey:k_Title]];
            
            if([indexPath isEqual:prevIndexPath] || [cell.lblTitle.text isEqualToString:strStoredMenuTitle]){ //set for selected cell
                prevIndexPath = indexPath; //For assigning previousIndexPath from stored title
                
                cell.backgroundColor = COLOR_NAV_SELECTED;
            }
            else{ //set for default
                
                cell.backgroundColor = [UIColor clearColor];
            }
            
            return cell;
        }
    }
    
    return [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView == menuTableView){
        
        strStoredMenuTitle = @"";
        
        if(prevIndexPath){
            
            NSMutableDictionary *d=[arrayMenuOptions objectAtIndex:prevIndexPath.row] ;
            
            if([[d objectForKey:k_Level] isEqualToString:@"0"]){ //Parent Menu
                
                CCellMenu *prevCell = (CCellMenu *)[tableView cellForRowAtIndexPath:prevIndexPath];
                prevCell.backgroundColor = [UIColor clearColor];
            }
            else{ // SubMenu
                
                CCellSubMenu *prevCell = (CCellSubMenu *)[tableView cellForRowAtIndexPath:prevIndexPath];
                prevCell.backgroundColor = [UIColor clearColor];
            }
            
        }
        
        if(indexPath.row == 1){
            prevIndexPath = nil;
        }
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        NSMutableDictionary *d=[arrayMenuOptions objectAtIndex:indexPath.row];
        CCellMenu *cell = (CCellMenu *)[tableView cellForRowAtIndexPath:indexPath];
        
        if([[d objectForKey:k_Level] isEqualToString:@"0"]){ //Parent Menu
            
            cell.backgroundColor = COLOR_NAV_SELECTED;
        }
        else{ // SubMenu
            
            CCellSubMenu *cell = (CCellSubMenu *)[tableView cellForRowAtIndexPath:indexPath];
            cell.backgroundColor = COLOR_NAV_SELECTED;
        }
        
        
        //==================START:  Expand/Colapse Code ============================
        
        if([[d objectForKey:k_HasSubMenu] isEqualToString:@"1"]){
            NSArray *ar=[d objectForKey:k_SubMenu];
            
            prevIndexPath = nil;
            
            BOOL isAlreadyInserted=NO;
            
            for(NSDictionary *dInner in ar )
            {
                NSInteger index=[arrayMenuOptions indexOfObjectIdenticalTo:dInner];
                isAlreadyInserted=(index>0 && index!=NSIntegerMax);
                if(isAlreadyInserted) break;
            }
            
            if(isAlreadyInserted)
            {
                arrayToCollapseRef = [NSMutableArray new];
                
                [self miniMizeThisRows:ar];
                
                if([arrayToCollapseRef count]>0){
                    
                    
                    NSMutableIndexSet *set = [NSMutableIndexSet new];
                    for(NSIndexPath *idxPath in arrayToCollapseRef)
                        [set addIndex:idxPath.row];
                    
                    
                    [arrayMenuOptions removeObjectsAtIndexes:set];
                    [menuTableView deleteRowsAtIndexPaths:arrayToCollapseRef withRowAnimation:UITableViewRowAnimationBottom];
                    [[arrayMenuOptions objectAtIndex:indexPath.row] setObject:@"0" forKey:k_IsOpen];
                    cell.imgViewRight.image = [UIImage imageNamed:@"plus"];
                    cell.lblTitle.font = kFont_Menu_Regular;
                    
                }
                
            }
            else
            {
                NSUInteger count=indexPath.row+1;
                NSMutableArray *arCells=[NSMutableArray array];
                
                for(NSDictionary *dInner in ar)
                {
                    [arCells addObject:[NSIndexPath indexPathForRow:count inSection:0]];
                    [arrayMenuOptions insertObject:dInner atIndex:count++];
                }
                
                [tableView insertRowsAtIndexPaths:arCells withRowAnimation:UITableViewRowAnimationTop];
                [[arrayMenuOptions objectAtIndex:indexPath.row]  setObject:@"1" forKey:k_IsOpen];
                cell.imgViewRight.image = [UIImage imageNamed:@"minus"];
                cell.lblTitle.font = kFont_Menu_Bold;
            }
            
        }
        else
        {
            [self closeAllOpenedMenu];
            
            //UIViewController *parentVC= (UIViewController *)delegate;
            NSString *strOption = [d valueForKey:k_Title];
            
            if([strOption isEqualToString:k_Menu_Home]){
                
                if(![AppDelegate isScreenVisibleForViewController:[HomeVC class]]){
                    
                    HomeVC *objHomeVC = MAKE_STORY_OBJ_R1(@"idHomeVC");
                    //objHomeVC.strTitle = @"Home";
                    [APP_DELEGATE setRootViewController:objHomeVC animated:YES];
                }
            }
            else if([strOption isEqualToString:k_Menu_Search]){
                
              
            }
            else if([strOption isEqualToString:k_Menu_PDS]){
            }
            else if([strOption isEqualToString:k_Menu_LookBid]){
            }
            else if([strOption isEqualToString:k_Menu_Forthcoming]){
            }
            else if([strOption isEqualToString:k_Menu_Exhibition]){
            }
            else if([strOption isEqualToString:k_Menu_MySelection]){
            }
            else if([strOption isEqualToString:k_Menu_ConfirmedGoods]){
            }
            else if([strOption isEqualToString:k_Menu_WishList]){
            }
            else if([strOption isEqualToString:k_Menu_MyBids]){
            }
            else if([strOption isEqualToString:k_Menu_Consignment]){
            }
            else if([strOption isEqualToString:k_Menu_Reservation]){
            }
            else if([strOption isEqualToString:k_Menu_InHouse_viewing]){
            }
            else if([strOption isEqualToString:k_Menu_MyProfile]){
            }
            else if([strOption isEqualToString:k_Menu_MyDetails]){
            }
            else if([strOption isEqualToString:k_Menu_ChangePassword]){
            }
            else if([strOption isEqualToString:k_Menu_ManageNotification]){
            }
            else if([strOption isEqualToString:k_Menu_BusinessSummary]){
            }
            else if([strOption isEqualToString:k_Menu_Feedback]){
            }
            else if([strOption isEqualToString:k_Menu_MyCustomization]){
            }
            else if([strOption isEqualToString:k_Menu_Sub_Search]){
            }
            else if([strOption isEqualToString:k_Menu_Result]){
            }
            else if([strOption isEqualToString:k_Menu_OtherPreferences]){
            }
            else if([strOption isEqualToString:k_Menu_WritetoVenus]){
            }
            else if([strOption isEqualToString:k_Menu_HowToRemit]){
            }
            else if([strOption isEqualToString:k_Menu_ShippingExpense]){
            }
            else if([strOption isEqualToString:k_Menu_Logout]){
                
                LoginVC *objLoginVC = MAKE_STORY_OBJ_R1(@"idLoginVC");
                [APP_DELEGATE setRootViewController:objLoginVC animated:YES];
            }
            
            
            // Push next view code goes here...
        }
        
        //================== END: Expand/Colapse Code ============================
        
        
        prevIndexPath = indexPath;
    }
}




#pragma mark - Dynamic Menu

-(void)prepareMenu{
    
    prevIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    //For Main Menu Option
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MenuList" ofType:@"plist"];
    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    NSMutableArray *arrayMenuOptionsTemp = [[NSMutableArray alloc] initWithArray:array copyItems:YES];
    arrayMenuOptions = [arrayMenuOptionsTemp deepMutableCopy];
    [menuTableView reloadData];
}

-(void)miniMizeThisRows:(NSArray*)ar{
    
    for(NSDictionary *dInner in ar )
    {
        NSUInteger indexToRemove=[arrayMenuOptions indexOfObjectIdenticalTo:dInner];
        NSArray *arInner=[dInner objectForKey:@"k_SubMenu"];
        
        if(arInner && [arInner count]>0)
        {
            [self miniMizeThisRows:arInner];
            
        }
        
        if([arrayMenuOptions indexOfObjectIdenticalTo:dInner]!=NSNotFound)
        {
            [arrayToCollapseRef addObject:[NSIndexPath indexPathForRow:indexToRemove inSection:0]];
        }
    }
}

-(void)closeAllOpenedMenu{
    
    float delay = 0.0;
    [self performSelector:@selector(closeMenu) withObject:nil afterDelay:delay];
}

-(void)closeMenu{
    
    if(!self)
        return;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect rect = self.view.frame;
        rect.origin.x -= rect.size.width;
        self.view.frame = rect;
        
        UIViewController *topVC = (UIViewController *)self.delegate;
        topVC.view.alpha = 1.0;
        topVC.navigationController.navigationBar.alpha = 1.0;
        
        UINavigationController *nav=(UINavigationController *)APP_DELEGATE.window.rootViewController;
        UIViewController *vc = (UIViewController *)nav.topViewController;
        vc.view.alpha = 1.0;
        vc.navigationController.navigationBar.alpha = 1.0;
        
    } completion:^(BOOL finished) {
        self.view.hidden = YES;
    }];
}

@end
