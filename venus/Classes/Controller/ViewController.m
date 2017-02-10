//
//  ViewController.m
//  Test_AFNetworking
//
//  Created by sandip.patel on 17/09/14.
//  Copyright (c) 2014 BrainVire Infotech Pvt. Ltd. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Textfield Delegate Methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	return YES;
}

#pragma mark - Example Test API

//[Note: I just prepared demo for calling "account" API using different different type of serviceType like: GET, POST, PATCH etc... ]

- (IBAction)webservice_GET:(id)sender {
	
   
    
}

- (IBAction)webservice_GET_WithResultTracingPath:(id)sender {
    
      
}

#pragma - mark Example API with Validation

/*
- (IBAction)apiLogin:(id)sender {
    
    NSArray *aryValidations = @[
                                @{K_VALIDATION_FIELD_VALUE : txtAuthorizationEmail.text, K_VALIDATION_TYPE : [NSNumber numberWithInt:VALIDATION_EMAIL], K_VALIDATION_IDENTIFIER : @"email",},
                                ];
    
    
    NSDictionary *dictValidationStatus = [Validation validate:aryValidations];
    
    if([[dictValidationStatus valueForKey:K_VALIDATION_STATUS] intValue]){     // Validation success
        
        NSDictionary *dictHeader = [NSDictionary dictionaryWithObjectsAndKeys: txtAuthorizationEmail.text,@"Authorization", nil];
        
        [API apiWebService:API_LOGIN serviceType:SERVICE_GET parameters:nil header:dictHeader WithBlock:^(NSDictionary *response, NSError *error) {
            
            if(error){
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"API Response" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alert show];
                
            }
            else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"API Response" message:[response description] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alert show];
            }
        }];
        
    }
    else{     // Validation fail
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Validation" message:[dictValidationStatus valueForKey:K_VALIDATION_MESSAGE] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
}

*/

@end
