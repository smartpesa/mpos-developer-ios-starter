//
//  SmartPesaSDK.h
//  SmartPesaSDK
//
//  Created by Arun on 20/2/15.
//  Copyright (c) 2015 SmartPesa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>

#import "SmartPesaConstants.h"

@class SmartPesaBaseResponse;
@class VerifyMerchantInfo;
@class TransactionResult;
@class Operator;
@class Transaction;
@class ProcessTLVResponse;
@class Card;
@class Balance;

@protocol SmartPesaDelegate <NSObject>

@required

- (void)onError:(SmartPesaBaseResponse *)error;
- (void)onFailureWithCustomError:(NSError *)error;
- (void)success:(SmartPesaBaseResponse *)resposneObject;
- (void)onSessionError;

@optional

- (void)bluetoothDisconnected:(NSString *)message;
- (void)bluetoothScanTimeout:(NSString *)message;
- (void)bluetoothConnectTimeout:(NSString *)message;
- (void)brequestEnableBluetoothInSettings;
- (void)devicesFound:(NSArray *)devices;
- (void)onDeviceConnected:(CBPeripheral *)device;
- (void)onWisePadBTv4Disconnected:(NSString *)message;

- (void)showConfirmInputPrompt;
- (void)onProgressTextUpdate:(NSString *)message;
- (void)onLoading;
- (void)onLoadingEnd;
- (void)hideDialog;
- (void)onCardInserted:(NSString *)message;
- (void)showInsertChipAlertPrompt;
- (void)finishWithMessage:(NSString *)mErrorText :(SMARTPESAERROR)errorValue;
- (void)onWaitingForCard:(NSString *)message;
- (void)updateCardUI:(Card *)card;
- (void)onReturnAmountConfirmationResult:(BOOL)isConfirmed;
- (void)onReturnPhoneNumber:(PHONEENTRYSTATUS)status;
- (void)showSelectAppAlertPromptIfNecessary:(NSArray *)applist;
- (void)showConfirmAmountPrompt;
- (void)cancelSetAmount;
- (void)showPinAlertPrompt;
- (void)sendServerConnectivity:(BOOL)status;
- (void)handlePesaPodError:(NSString *)message;
- (void)onTransactionFinished:(TransactionType)type :(TRANSACTION_RESULT)result :(ProcessTLVResponse *)response :(BOOL)isSuccess :(NSString *)message :(SMARTPESAERROR)error;
- (void)selectApplications:(NSArray *)applicationArray;
- (void)onGetSignatureImage:(UIImage *)signatureImage;


@end

@interface SmartPesaSDK : NSObject


+ (SmartPesaSDK*)sharedInstance;
- (void)initializeSDKWithDevice:(MPOSDeviceType)device SSLCerificateName:(NSString *)cName withPin:(NSString *)cPin andEndPoint:(NSString *)endPoint;

- (void)getVersion;
- (void)verifyMerchant:(NSString *)merchantID andOperatorID:(NSString *)operatorID withMerchantCode:(NSString *)merchantCode;
- (void)getHistory:(int)pageCount isAllHistory:(BOOL)allOption;
- (void)sendNotification:(NSString *)transactionId email:(NSString *)emailId notification_sms:(NSString *)phoneNo extramParams:(NSDictionary *)extraParams;
- (void)sendHistory:(NSString *)emailID from:(NSDate *)startDate to:(NSDate *)endDate;
- (NSArray *)getAllowedTransactionTypePermission;

+ (void)loadDefaultSettings;
- (NSDictionary *)getSettings;
- (void)saveSettingsWithURL:(NSString *)platform_url httpMethod:(BOOL)usePost SSLenabled:(BOOL)useSSL andDeviceType:(MPOSDeviceType)device;
- (void)getSignature:(NSString *)transaction_id;
- (void)initialisePrinter:(PESA_PRINTER)printer;
- (void)printReceipt:(int)numOfReceipt andData:(NSString *)receiptData;
- (void)getOperators;
- (void)addOperator:(Operator *)operator_;
- (void)disableOperator:(NSString *)operator_id;
- (void)updateOperator:(Operator *)operator_;
- (void)getCountryCode;
- (void)getGeoFence:(NSString *)transaction_id;
- (void)getAccountType;
- (void)forgotPin:(NSString *)merchantCode :(NSString *)operatorCode;
- (void)logout;
- (void)getStatistics:(NSDate *)startDate :(NSDate *)endDate :(BOOL)isAll;
- (void)getTransaction:(NSString *)transactionID;
- (void)getReceipt:(NSString *)transactionID receiptFormat:(RECEIPT_FORMAT)receiptFormat;
- (void)getServices;
- (void)getPrintHistory:(NSDate *)startDate :(NSDate *)endDate;
- (void)getAquiringInstitutions;
- (void)processSignOn:(NSDictionary *)params;
- (void)getBillingOrganisations;
- (void)getMerchantInfo;
- (void)getDevices;
- (void)settlementCutOver;
- (void)setVoidTransaction;
- (void)getDynamicCurrency:(NSString *)fromISO :(NSString *)toISO;
- (void)sendPersistSignatureFor:(NSString *)transactionID singatureImage:(UIImage *)singatureImage;
- (void)getAvailableCurrencies;
- (NSArray *)getAllowedTransactionTypePermissions;

- (Transaction *)getLastSuccessfulTransaction;

- (void)initializeTransactionForAmount:(double)amount cashBackAmount:(double)cashBack forDevicetType:(MPOSDeviceType)deviceType fromAccountType:(AccountType)fromAccountType toAccountType:(AccountType)toAccountType parmas:(NSDictionary *)parameters;
- (void)performTransactionWithTransactionType:(TransactionType)transaction_type using:(CBPeripheral *)bluetoothDevice;
- (VerifyMerchantInfo *)getCachedMerchant;

- (void)setDelegate:(NSObject<SmartPesaDelegate> *)delegate;


@end
