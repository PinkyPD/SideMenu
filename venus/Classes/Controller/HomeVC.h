//
//  HomeVC.h
//  venus
//
//  Created by bviadmin on 06/02/17.
//  Copyright © 2017 Brainvire. All rights reserved.
//

#import "ExtendedViewController.h"

@class CustomBadge;
@interface HomeVC : ExtendedViewController<UITextFieldDelegate>{
    
    CGFloat  widthDimond, heightDimond, stripSpace, posMoveToY , xGap;
    CGFloat widthLogo,heightLogo;
    
    
    float _panStartY;
    CGPoint _panStartScrollOffset;
    
    
    CGPoint InitialPos1,InitialPos2,InitialPos3,InitialPos4,InitialPos5;
    
    IBOutlet UIControl *viewOptions1, *viewOptions2, *viewOptions3, *viewOptions4, *viewOptions5, *viewOptions6;
    IBOutlet UIView *viewOptionsContainer;
    IBOutlet UILabel *lblConfirmedGoods, *lblWishlist, *lblForthComing, *lblMyBids, *lblInhouseViewing, *lblConsignment;
    IBOutlet UIImageView *imgViewBanner1, *imgViewBanner2;
    IBOutlet UIButton *btnNotification;
    UIControl *viewLastControl;
    
    CustomBadge *badgeNotification;
}

@property (weak, nonatomic) IBOutlet UIScrollView *mTableView;
@property (weak, nonatomic) IBOutlet UIView *containerUIView;
@property (weak, nonatomic) IBOutlet UIImageView *mImageView;
//@property (weak, nonatomic) IBOutlet UILabel *mUILabel;


@property (weak, nonatomic) IBOutlet UIImageView *mImageViewDiamond,*mImageViewLogo;

@property (weak, nonatomic) IBOutlet UIControl *mImageView1;
@property (weak, nonatomic) IBOutlet UIControl *mImageView2;
@property (weak, nonatomic) IBOutlet UIControl *mImageView3;
@property (weak, nonatomic) IBOutlet UIControl *mImageView4;
@property (weak, nonatomic) IBOutlet UIControl *mImageView5;

@end
