//
//  TransactionDetailCell.m
//  SmartPesa
//
//  Created by Arun on 22/2/15.
//  Copyright (c) 2015 SmartPesa. All rights reserved.
//

#import "TransactionDetailCell.h"

static NSString *emailKey   = @"xbdbdbbf";
static NSString *mobileKey  = @"sdgsdgs";
static NSString *typekey    = @"wefwwevwc";
static NSString *tidkey     = @"qsmlnf";

@interface TransactionDetailCell()<UITextFieldDelegate>

@property(nonatomic, weak)IBOutlet UILabel *transactionStatus;
@property(nonatomic, weak)IBOutlet UILabel *transactionResponseStatus;

@property(nonatomic, weak)IBOutlet UILabel *cardNumber;
@property(nonatomic, weak)IBOutlet UILabel *cardName;
@property(nonatomic, weak)IBOutlet UILabel *cardExpiry;
@property(nonatomic, weak)IBOutlet UILabel *transactionDetails;
@property(nonatomic, weak)IBOutlet UIImageView *cardTypeImage;

@property(nonatomic, weak)IBOutlet UITextField *mobileNumber;
@property(nonatomic, weak)IBOutlet UITextField *emailID;



@property(nonatomic, weak)IBOutlet UIButton *doneButton;

@property(nonatomic, assign)Transaction *currentTransaction;

- (IBAction)finishAction:(id)sender;
- (IBAction)printReceiptAction:(id)sender;
- (IBAction)valueChanged:(id)sender;


@end

@implementation TransactionDetailCell



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/*- (void)setTransactionDetailsWith:(Transaction *)transaction
{

    if (transaction.authorisation_response_code.intValue != 0)
    {
        _transactionStatus.text = @"Transaction Unsuccessful";
        _transactionStatus.textColor = [UIColor redColor];
    }
    else
    {
        _transactionStatus.text = @"Transaction Successful";
        _transactionStatus.textColor = [UIColor blueColor];
    }
    
    _transactionResponseStatus.text = transaction.resposneDescription;
    
    _cardNumber.text = transaction.card_number;
    _cardName.text = transaction.card_holder_name;
    _cardExpiry.text = transaction.card_expiry;
    
    if ([[transaction.card_name lowercaseString] isEqualToString:@"VISA Debit/Credit"] || [[transaction.card_name lowercaseString] isEqualToString:@"visa"])
        _cardTypeImage.image = [UIImage imageNamed:@"logo_visa.png"];
    else if ([[transaction.card_name lowercaseString] isEqualToString:@"mastercard"])
        _cardTypeImage.image = [UIImage imageNamed:@"logo_mastercard.png"];
    else if([[transaction.card_name lowercaseString] isEqualToString:@"maestro"])
        _cardTypeImage.image = [UIImage imageNamed:@"logo_maestro.png"];
    else if ([transaction.card_name isEqualToString:@"SmartCash"])
        _cardTypeImage.image = [UIImage imageNamed:@"logo_smartcash.png"];
    else if ([transaction.card_name isEqualToString:@"American Express"])
        _cardTypeImage.image = nil;
    else
        _cardTypeImage.image = nil;
}





- (void)setContactDetails:(Transaction *)transaction
{
    if ([transaction.notification_phone length] > 0)
    {
        _mobileNumber.text = transaction.notification_phone;
    }
    else
    {
        _mobileNumber.text = @"";//[[[SmartPesaSDK sharedInstance] getMerchant] defaultDialingCode];
    }
    
    _emailID.text = transaction.notification_email;
    
    _mobileNoCheckBox.checkAlignment = M13CheckboxAlignmentLeft;
    _emailIDCheckBox.checkAlignment = M13CheckboxAlignmentLeft;
    
    _mobileNoCheckBox.strokeColor = [UIColor blackColor];
    _mobileNoCheckBox.strokeWidth = 2.0;
    _mobileNoCheckBox.checkColor = [UIColor blackColor];
    
    _emailIDCheckBox.strokeColor = [UIColor blackColor];
    _emailIDCheckBox.strokeWidth = 2.0;
    _emailIDCheckBox.checkColor = [UIColor blackColor];
    
    [[_mobileNumber layer] setBorderColor:[UIColor blackColor].CGColor];
    [[_mobileNumber layer] setBorderWidth:1.0];
    _mobileNumber.layer.cornerRadius = 7;
    
    [[_emailID layer] setBorderColor:[UIColor blackColor].CGColor];
    [[_emailID layer] setBorderWidth:1.0];
    _emailID.layer.cornerRadius = 7;
    
    self.currentTransaction = transaction;
}
*/
/*
#pragma mark - Action methods
- (IBAction)finishAction:(id)sender
{
    if (_mobileNoCheckBox.checkState == M13CheckboxStateChecked || _emailIDCheckBox.checkState == M13CheckboxStateChecked)
    {
        NSString *emailIDText = [_emailID text];
        NSString *mobileNoText = [_mobileNumber text];

        if ([emailIDText length] > 0 || [mobileNoText length] > 0)
        {
            
            if (!([[_emailID text] length] > 0 && _emailIDCheckBox.checkState == M13CheckboxStateChecked))
                emailIDText = @"";
            if (!([[_mobileNumber text] length] > 0 && _mobileNoCheckBox.checkState == M13CheckboxStateChecked))
                mobileNoText = @"";
            
            if ([emailIDText length] > 0 && ![mSession isValidEmail:emailIDText])
            {
                UI_Alert(@"", @"Provide a valid email!");
                return;
            }
            
            [[SmartPesaSDK sharedInstance] setDelegate:self];
            [[SmartPesaSDK sharedInstance] sendNotification:self.currentTransaction.transaction_id email:emailIDText notification_sms:mobileNoText extramParams:nil];

        }
        else
            UI_Alert(@"", @"Provide your Email or Mobile number!");
    }
    else
    {
        UITableView *tableView = (UITableView *)self.superview.superview;
        UIViewController *obj = (UIViewController *)[tableView dataSource];
        [obj.navigationController popViewControllerAnimated:YES];
    }
}


- (IBAction)printReceiptAction:(id)sender
{

}

- (IBAction)valueChanged:(id)sender
{
    if ([[_emailID text] length] > 0 && _emailIDCheckBox.checkState == M13CheckboxStateChecked)
    {
        [_doneButton setTitle:@"Send" forState:UIControlStateNormal];
        
    }
    else if ([[_mobileNumber text] length] > 0 && _mobileNoCheckBox.checkState == M13CheckboxStateChecked)
        [_doneButton setTitle:@"Send" forState:UIControlStateNormal];
    else
        [_doneButton setTitle:@"Finish" forState:UIControlStateNormal];
}



#pragma mark - UITextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    BOOL isNumberic = YES;
    if ([_mobileNumber isEqual:textField])
    {
        NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:PHONE_NO] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
        isNumberic = [string isEqualToString:filtered];
    }
    
    [self performSelector:@selector(valueChanged:) withObject:nil afterDelay:0.3];
    return isNumberic;
}

#pragma mark - Webservice Delegate
- (void)onSendNotificationResult
{
    [_emailID resignFirstResponder];
    [_mobileNumber resignFirstResponder];
    [[[iToast makeText:@"Notifications Send!"] setGravity:iToastGravityCenter] show];
}

- (void)onError:(NSError *)error
{
    UI_Alert(@"", [error localizedDescription]);
    //[Crittercism logError:error];
}

*/

@end
