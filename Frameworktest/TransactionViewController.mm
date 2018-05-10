//
//  TransactionViewController.m
//  SmartPesa
//
//  Created by Arun on 4/4/15.
//  Copyright (c) 2015 SmartPesa. All rights reserved.
//

#import "TransactionViewController.h"
#define APP_THEME_COLOR  [UIColor colorWithRed:233.0/255.0 green:175.0/255.0 blue:10.0/255.0 alpha:1]


@interface TransactionViewController ()<SmartPesaDelegate, UIAlertViewDelegate>

@property(nonatomic, strong)NSMutableArray *btLEDevicesList;
@property(nonatomic, weak)IBOutlet UITableView *deviceListTable;
@property(nonatomic, weak)IBOutlet UILabel *statusLabel;

@property(nonatomic, weak)IBOutlet UITextField *amountTextField;
@property(nonatomic, weak)IBOutlet UITextField *referenceTextField;
@property(nonatomic, weak)IBOutlet UILabel *cnameDisplay;

@end

@implementation TransactionViewController

@synthesize transactionType;
@synthesize reference;
@synthesize amount;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    switch (transactionType)
    {
        case GOODS_AND_SERVICES:
            self.title = @"Payment";
            break;
        case BALANCE_INQUIRY:
            self.title = @"Inquiry";
            break;
        case REFUND_TRANSACTION:
            self.title = @"Refund";
            break;

            
        default:
            self.title = @"title: Not assigned";
            break;
    }
    
    self.amountTextField.text = self.amount;
    self.referenceTextField.text = self.reference;
    
    [self.deviceListTable.layer setBorderColor:APP_THEME_COLOR.CGColor];
    [self.deviceListTable.layer setBorderWidth:2.0];
    [self.deviceListTable.layer setCornerRadius:7.0];
    
    NSString *currencyName = self.merchant.mCurrency.currency_symbol;
    self.cnameDisplay.text = currencyName;
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [[SmartPesaSDK sharedInstance] setDelegate:self];
    [self startTransaction];

}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    [SmartPesaSDK sharedInstance].delegate = nil;
    //[[SmartPesaSDK sharedInstance] disconnectDevice];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.btLEDevicesList count] > 0)
        return [self.btLEDevicesList count];
    else
        return 1;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"listrow";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }

    if ([self.btLEDevicesList count] > 0)
    {
        CBPeripheral *peripheral = [self.btLEDevicesList objectAtIndex:indexPath.row];
        cell.textLabel.text = [peripheral name];
        cell.detailTextLabel.text = [peripheral.identifier UUIDString];
    }
    else
        cell.textLabel.text = @"No Devices Found";

    return cell;
}


#pragma mark- Tableview delegates
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.btLEDevicesList count] > 0)
    {
        CBPeripheral *peripheral = [self.btLEDevicesList objectAtIndex:indexPath.row];
        self.statusLabel.text = [NSString stringWithFormat:@"Connecting to %@", [peripheral name]];
        [[SmartPesaSDK sharedInstance] performTransactionWithTransactionType:self.transactionType using:peripheral];
    }
}

- (void)devicesFound:(NSArray *)devices
{
    self.statusLabel.text = @"Tap a device to connect...";
    
    self.btLEDevicesList = [[NSMutableArray alloc] initWithArray:devices];
    [self.deviceListTable reloadData];
}

- (void)onDeviceConnected:(CBPeripheral *)peripheral
{
    self.statusLabel.text = [NSString stringWithFormat:@"Connected to %@", [peripheral name]];
}


- (void)onWisePadWaitingForCard
{
#warning check this method?????
}

- (void)selectedApplication:(int)appId
{
    NSLog(@">>>> %d", appId);
}

- (void)startTransaction
{
    [[SmartPesaSDK sharedInstance] initializeTransactionForAmount:[self.amountTextField.text doubleValue] cashBackAmount:[@"0" doubleValue] forDevicetType:PESA_POD_Device fromAccountType:DEFAULT toAccountType:DEFAULT parmas:nil];
    
}

- (void)onWisepadUpdateStatus:(NSString *)newStatus
{
    self.statusLabel.text = newStatus;
}



- (void)onError:(NSError *)error
{
    
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}




//MARK:- SMART PESA SDK DELGATES
- (void)showConfirmInputPrompt
{
    NSLog(@"%s", __FUNCTION__);
}
- (void)onProgressTextUpdate:(NSString *)message
{
    NSLog(@"%s", __FUNCTION__);
}
- (void)onLoading
{

}
- (void)onLoadingEnd
{
}
- (void)hideDialog
{
    NSLog(@"%s", __FUNCTION__);
}
- (void)onCardInserted:(NSString *)message
{
    NSLog(@"%s", __FUNCTION__);

}



- (void)showInsertChipAlertPrompt
{
    NSLog(@"%s", __FUNCTION__);

}
- (void)finishWithMessage:(NSString *)mErrorText :(SMARTPESAERROR)errorValue
{

}


- (void)onWaitingForCard:(NSString *)message
{
    NSLog(@"%s", __FUNCTION__);

}
- (void)updateCardUI:(Card *)card
{
    NSLog(@"%s", __FUNCTION__);

}
- (void)onReturnAmountConfirmationResult:(BOOL)isConfirmed
{
    NSLog(@"%s", __FUNCTION__);

}
- (void)onReturnPhoneNumber:(PHONEENTRYSTATUS)status
{
    NSLog(@"%s", __FUNCTION__);

}
- (void)showSelectAppAlertPromptIfNecessary:(NSArray *)applist
{
    NSLog(@"%s", __FUNCTION__);

}
- (void)showConfirmAmountPrompt
{
    NSLog(@"%s", __FUNCTION__);
}
- (void)cancelSetAmount
{

}
- (void)showPinAlertPrompt
{
    NSLog(@"%s", __FUNCTION__);

}
- (void)sendServerConnectivity:(BOOL)status
{
    NSLog(@"%s", __FUNCTION__);

}
- (void)handlePesaPodError:(NSString *)message
{
    NSLog(@"%s", __FUNCTION__);

}

- (void)onTransactionFinished:(TransactionType)type :(TRANSACTION_RESULT)result :(ProcessTLVResponse *)response :(BOOL)isSuccess :(NSString *)message :(SMARTPESAERROR)error
{
    
    if (result == SIGNATURE)
    {
        NSLog(@"%s Show Signature page", __FUNCTION__);

    }
    else
    {
        if (response)
        {
            NSLog(@"%s Transacton details page", __FUNCTION__);

        }
        else
        {
            NSLog(@"Error is shown on the screen");
        }

    }

}

- (void)onFailureWithCustomError:(NSError *)error
{
    NSLog(@"%s", __FUNCTION__);

}

- (void)selectApplications:(NSArray *)applicationArray
{
    NSLog(@"%s", __FUNCTION__);

}
- (void)onGetSignatureImage:(UIImage *)signatureImage
{

}

@end
