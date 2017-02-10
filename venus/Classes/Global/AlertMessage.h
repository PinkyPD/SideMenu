//
//  AlertMessage.h
//  Nirav Modi
//
//  Created by Pinky on 10/22/16.
//  Copyright © 2016 Brainvire. All rights reserved.
//

#ifndef AlertMessage_h
#define AlertMessage_h


//********************Global********************//
#define IN_PROGRESS @"Development in-progress"

//#define AL_SYNC_MSG                 @"Data available for sync, Do you want to download ?"
//#define AL_SYNC_SUCCESS             @"Successfully sync"
//#define AL_SYNC_NO_DATA             @"No sync data found"
#define AL_NOCONTENT_MSG            @"There is no content" // Dont Comment
//define AL_INTERACTION_CLOSE_MSG    @"Do you want to close the interaction without saving ?"
//#define AL_SESSION_CLOSE_MSG        @"Do you want to close session ?"

//#define AL_SYNC_RUNNING_MSG         @"Please wait for syncing"


//#define AL_CC_MIN_PRODUCT_MSG       @"Select at least 1 product from cart list"
//#define AL_CC_MAX_PRODUCT_MSG       @"You can select max items"
//#define AL_CC_ADD_PRODUCT_MSG       @"Please add product in cart"
//#define AL_SELECT_COUNTRY_MSG       @"Please select country"
//#define AL_NO_CITY_MSG              @"No city found for selected country"
//#define AL_DOWNLOAD_FAIL            @"Download Fail"

//********************Landing********************//
//#define ERROR_COUNTRY_FETCH @"Server not responding, Please try after some time."
//#define AL_NO_SYNC @"Please wait for syncing."

//#define AL_REQUEST_PENDING @"Request Pending, Please wait for Admin Approval!"
//#define AL_REQUEST_REJECTED @"Request rejected!"
//#define AL_REQUEST_CONTACT_IPAD_ADM @"Invalid Request, Please contact your iPad Administrator."
//#define AL_PASSCODE_NOT_MATCH @"Passcode did not match. Try again."
//#define AL_INVALID_PIN @"Invalid PIN code"
//#define AL_ENTER_PASSCODE @"Please Enter Passcode"
#define AL_NAME @"Enter Name"
#define AL_EMAIL @"Enter Email ID"
#define AL_VALID_EMAIL @"Enter Valid Email ID"
#define AL_COUNTRY @"Select Country"
#define AL_LOCATION @"Select Location"
#define AL_LANGUAGE @"Select Language"
//#define AL_INVALID_LOCATION_PASSCODE  @"Invalid Location Passcode"
//#define AL_LLOCATION_PASSCODELOCK @"Location Passcode is locked. Try after 60 Seconds."
//#define AL_SINGLE_LOCATION_ERROR @"Atleast a Location Should be selected!!"
//********************Exchange Rate********************//
//#define AL_EXCHANGE_RATE_ERROR @"Exchange rate field cannot be blank or zero."
//#define AL_MARKUP_ERROR @"Mark up cannot be more than 3 characters."
//#define AL_USD_EXCHANGE_RATE @"USD exchange rate field cannot be blank or zero."
//********************Common API*****************//
#define K_NO_INTERNET @"Internet connection is not available." //Dont Comment


//#define K_AUTH_FAIL_TITLE           @"Authentication Failure!"
//#define K_AUTH_FAIL_MSG             @"Please sync to update salesforce credentials or check internet connectivity."
//#define K_AUTH_FAIL_INVALIDGRANT_MSG     @"Sync the updated SalesForce credential."


//#define K_SF_ERROR_TITLE           @"Salesforce Post Error"
//#define K_SF_SERVER_ERROR_MSG            @"Server error"

//#define AL_AUTH_SUCCESS             @"Authentication successful. Post data to salesforce is under progress."
//#define AL_INTERACTION_UPLOAD_SUCCESS      @"Interaction Upload to Salesforce Successful !"


//********************Collection & Category List*****************//







////********************Advance Filter*************//
//#define K_AF_NO_PRICE @"Atleast price list should be selected!"
//#define K_AF_NO_CATEGORY @"Atleast a category should be selected!"
//#define K_AF_NO_LOCATION @"Atleast a location should be selected!"
//#define K_AF_NO_COLLECTION @"Atleast a collection should be selected!"
//#define K_AF_NO_SIZE @"Atleast a size should be selected!"
//#define K_AF_NO_COLOR @"Atleast a color should be selected!"
//
//
////********************Gallary********************//
//
////********************Product Details********************//
//
//#define K_NO_MAIL_CLIENT @"Please configure mail client."
//#define K_NO_PDF @"PDF not available"
//#define K_NO_CELEB_PHOTOS @"Celebrities photos are not available."

#endif /* AlertMessage_h */
