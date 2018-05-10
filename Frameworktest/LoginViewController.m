
//
//  LoginViewController.m
//  SmartPesa
//
//  Created by Arun on 21/2/15.
//  Copyright (c) 2015 SmartPesa. All rights reserved.
//

#import "LoginViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <SmartPesa_mPOS/SmartPesaHeaders.h>
#import "PaymentViewController.h"

#define UI_Alert(TITLE,MSG) [[[UIAlertView alloc] initWithTitle:(TITLE) \
message:(MSG) \
delegate:nil \
cancelButtonTitle:@"OK" \
otherButtonTitles:nil] show]

@interface LoginViewController ()<UITextFieldDelegate, SmartPesaDelegate>

@property(nonatomic, weak)IBOutlet UITextField *merchantIDField;
@property(nonatomic, weak)IBOutlet UITextField *operatorIDField;
@property(nonatomic, weak)IBOutlet UITextField *merchantCodeField;

@property(nonatomic, weak)IBOutlet UIButton *forgotPasswordBtn;
@property(nonatomic, weak)IBOutlet UITextField *languageBtn;

- (IBAction)loginAction:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _merchantIDField.text = @"10012";
    _operatorIDField.text = @"100";
    _merchantCodeField.text = @"1234";

    [[_merchantIDField layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [[_merchantIDField layer] setBorderWidth:1.0];
    _merchantIDField.layer.cornerRadius = 7;

    [[_operatorIDField layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [[_operatorIDField layer] setBorderWidth:1.0];
    _operatorIDField.layer.cornerRadius = 7;
    
    [[_merchantCodeField layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [[_merchantCodeField layer] setBorderWidth:1.0];
    _merchantCodeField.layer.cornerRadius = 7;

    _forgotPasswordBtn.layer.cornerRadius = 7;
    _languageBtn.layer.cornerRadius = 7;

     // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    //[self loginAction:nil];
}

- (IBAction)dismissKeyboard:(id)sender
{
    [_merchantIDField resignFirstResponder];
    [_operatorIDField resignFirstResponder];
    [_merchantCodeField resignFirstResponder];
}

- (IBAction)loginAction:(id)sender
{
    if ([_merchantIDField.text length] == 0)
    {
        [[_merchantIDField layer] setBorderColor:[UIColor redColor].CGColor];
        [[_merchantIDField layer] setBorderWidth:2.0];
    }
    else
    {
        [[_merchantIDField layer] setBorderColor:[UIColor lightGrayColor].CGColor];
        [[_merchantIDField layer] setBorderWidth:1.0];
    }
    if ([_operatorIDField.text length] == 0)
    {
        [[_operatorIDField layer] setBorderColor:[UIColor redColor].CGColor];
        [[_operatorIDField layer] setBorderWidth:2.0];
    }
    else
    {
        [[_operatorIDField layer] setBorderColor:[UIColor lightGrayColor].CGColor];
        [[_operatorIDField layer] setBorderWidth:1.0];
    }
    if ([_merchantCodeField.text length] != 4)
    {
        UI_Alert(@"", @"Required four digit code");
        [[_merchantCodeField layer] setBorderColor:[UIColor redColor].CGColor];
        [[_merchantCodeField layer] setBorderWidth:2.0];
    }
    else
    {
        [[_merchantCodeField layer] setBorderColor:[UIColor lightGrayColor].CGColor];
        [[_merchantCodeField layer] setBorderWidth:1.0];
    }
    
    if ([[_merchantIDField text] length] > 0 && [[_operatorIDField text] length] > 0 && [[_merchantCodeField text] length] == 4)
    {
        [SmartPesaSDK sharedInstance].delegate = self;
        [[SmartPesaSDK sharedInstance] verifyMerchant:[_merchantIDField text] andOperatorID:[_operatorIDField text] withMerchantCode:[_merchantCodeField text]];
    }
    else
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}



#pragma mark - Webservice Delegate
- (void)success:(SmartPesaBaseResponse *)resposneObject
{
    if ([resposneObject isKindOfClass:[VerifyMerchantResposne class]])
    {
        VerifyMerchantResposne *merchant = (VerifyMerchantResposne *)resposneObject;
        VerifyMerchantInfo *userInfo = merchant.verifyMerchantInfo;
        
        PaymentViewController *newView = [self.storyboard instantiateViewControllerWithIdentifier:@"Payment"];
        newView.merchant = userInfo;
        [self.navigationController pushViewController:newView animated:YES];

        
    }
    else
    {
        //Login Error
    }
}


- (void)onFailureWithCustomError:(NSError *)error
{
    UI_Alert(@"", [error localizedDescription]);
}

- (void)onError:(NSError *)error
{
    UI_Alert(@"", [error localizedDescription]);
    // [Crittercism logError:error];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == _merchantCodeField)
    {
        NSString * searchStr = [textField.text stringByReplacingCharactersInRange:range withString:string];
        if ([searchStr length] > 4)
        {
            return NO;
        }
    }
    
    return YES;
}// return NO to not change text


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
