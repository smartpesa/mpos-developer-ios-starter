# Installation
SmartPesa SDK will be shared to developers on request. Please email to support@smartpesa.com.

The libSmartPesaSDK.a file has to be put into the project structure of your Xcode project.

# ServiceManager
ServiceManager is the main class which you will use to communicate with SmartPesa SDK to invoke SmartPesa’s APIs.

# Initializing ServiceManager
The ServiceManager needs to be initialized in the AppDelegate like below
```
  [[SmartPesaSDK sharedInstance] initializeSDKWithDevice:PESA_POD SSLCerificateName:@"" withPin:@""];
```
If you have SSL certificate, add it to your project folder and input its name with the PIN.

# Authentication
Authentication is a process for verifying a merchant’s identity. In its simplest form, authentication is the act of verifying a merchant’s claim on his or her identity and is usually implemented through a combination of merchantCode, operatorCode and operatorPin and it allows the merchant to log in into the SmartPesa and perform the transactions and other features offered by SmartPesa. 
Authentication is a two step process

# Establishing session
SmartPesa SDK uses session management for security and to validate access to the platform. 
Session must be established before you are able to access functions of SmartPesa SDK. This session expires at 12 AM local-time and needs to be renewed everyday. To instantiate/ renew the session. You need to invoke getVersion method of the ServiceManager class.

This method is also used to validate the version of the SDK you are using inside your application. If the version does not comply with the minimum version set by the Server (spStack), then it will raise an Error.

An expired or invalid session will trigger in an onSessionError callback on all function calls.

To initiate a new session on first load, you can follow the following code example
```
@implementation SplashViewController
 
- (void)viewDidLoad {
    [super viewDidLoad];
    //delegate to handle callbacks
    [SmartPesaSDK sharedInstance].delegate = self; 
    //perform getVersion
    [[SmartPesaSDK sharedInstance] getVersion];
}
 
- (void)viewDidDisappear:(BOOL)animated
 
{
    [super viewDidDisappear:YES];
    [SmartPesaSDK sharedInstance].delegate = nil;
}
 
- (void)success:(BaseModal *)resposneObject
{
 // Session has been established,
 // you can now call other methods. e.g. ServiceManager's verifyMerchant
}
 
- (void)onError:(NSError *)error
{
    //this handles all types of errors
    UI_Alert(@"", [error localizedDescription]);
}
 
- (void)onFailureWithCustomError:(NSError *)error
{
    //this handles all custom errors from SmartPesa server
    UI_Alert(@"", [error localizedDescription]);
}
 
@end
```
# Logging In
The process of verifying merchant is similar to any other authentication/ login process. MerchantCode, OperatorCode and OperatorPin combinations are matched against the server. If the three parameters match with the server's data, then the Merchant is allowed to perform transactions and other features of SmartPesa SDK.

If you are trying to invoke methods of ServiceManager that requires authenticated Merchant while you're not authenticated. It will result in onSessionError callback being triggered.

To verify the Merchant, you will need to use ServiceManager.verifyMerchant as shown in the following example:
```
[[SmartPesaSDK sharedInstance] verifyMerchant:[_merchantIDField text] andOperatorID:[_operatorIDField text] withMerchantCode:[_merchantCodeField text]];
//here the Merchant Id, Operator Id and the Merchant code are passed to the SDK
```
# Performing Transaction
Initialising a transaction
In order to initialise a transaction, we need to specify the following

amount 
cash back amount
Device type
from account type
to account type
any extra parmas (optional)
This can be explained with the example code snippet:
```
[[SmartPesaSDK sharedInstance] initializeTransactionForAmount:[self.amountTextField.text doubleValue] cashBackAmount:[@"0" doubleValue] forDevicetType:PESA_POD fromAccountType:Default toAccountType:Default parmas:nil];
```
In the above code, the amount is set to initializeTransactionForAmount from the self.amountTextField.text, which takes the text from a amount label and sets as a doubleValue.

Then the cashBackAmount is set as "0", just a constant for example, which also needs to be a doubleValue.

The forDeviceType is the type of PesaPod which is being used and in this it is a general PESA_POD.

The from and to account types are specified as Default which below to the enum ACCOUNTTYPE 
```
typedef enum  {
    Default = 0,
    Savings = 10,
    Current = 20,
    Credit = 30
}ACCOUNTTYPE;
```
The parmas are set as nil, which is optional. parmas are of type NSDictionary which can contain extra details of the transaction, for example a description.

Once the transaction is initialised, the the various callbacks are implemented in a ViewController which has SmartPesaDelegate.



# Scan Terminal

Before starting a transaction you should start to scan for the available bluetooth devices.

The list of devices will be listed in the devicesFound callback:
```
- (void)devicesFound:(NSArray *)devices
{
    //list of devices are assigned to a local list
    self.devicesList = [[NSMutableArray alloc] initWithArray:devices];
    //refresh the UI list to display the devices
    [self.deviceListTable reloadData];
}
```

The transaction begins once a device is selected from the list
```
[[SmartPesaSDK sharedInstance] performTransactionWithTransactionType:GOODS_AND_SERVICES using:peripheral];
```
In the above code the transaction type is specified as GOODS_AND_SERVICES and peripheral is the bluetooth device which does the transaction and it is of the Class CBPeripheral.

#Handling Transaction Callback
Once the device is selected the following call backs are used to define and respond to the User Interface of the application.
```
- (void)onDeviceConnected:(CBPeripheral *)peripheral
{
    //this call back is fired once the device is connected to a PESA_POD
    self.statusLabel.text = [NSString stringWithFormat:@"Connected to %@", [peripheral name]];
}
 
- (void)onWisePadWaitingForCard
{
    //this call back is fired when the PESA_POD is waiting to insert or swipe card.
    //you can use this to inform user to insert or swipe card
    self.statusLabel.text = @"Insert or swipe card";
}
 
- (void)onWisepadUpdateStatus:(NSString *)newStatus
{
    //this call back returns a NSString which helps to inform each and every status from the device
    self.statusLabel.text = newStatus;
}
 
 
- (void)onReturnTransactionSuccess:(BOOL)isSignatureRequired : (HostResponse *)hostResponse
{
    //this call back is called when the transaction is completed successfully
    //the HostResponse contains details of the transaction and display in the UI
     
    //isSignatureRequired is a BOOL which is used to check if the transaction needs a Signature or not
    if (isSignatureRequired)
    {
     //prompt UI to accept a signature from the user, saving the Signature is discussed later  
    } 
}
 
- (void)onReturnTransactionFailed:(HostResponse *)hostResponse
{
    //this call back is called when the transaction fails.
    //the HostResponse contains details of the transaction and display in the UI
}
 
- (void)onError:(NSError *)error
{
    //this call back is called when there are any errors, such as network error, connection error and etc.
     
    //here we show the error to the user in a UIAlertView
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:self cancelButtonTitle:@"OK"  otherButtonTitles:nil];
    [errorAlert show];
}
```
