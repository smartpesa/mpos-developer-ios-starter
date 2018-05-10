//
//  SmartPesa.h
//  SmartPesaSDK
//
//  Created by Arun on 17/2/16.
//  Copyright © 2016 SmartPesa. All rights reserved.
//

#ifndef SmartPesa_h
#define SmartPesa_h

typedef enum  {
    UNKNOWN_ACCOUNT_TYPE    = -1,
    DEFAULT                 = 0,
    SAVINGS                 = 10,
    CURRENT                 = 20,
    CREDIT                  = 30
    
}AccountType;

typedef enum  {
    UNKNOWN_AMOUNT_TYPE     = -1,
    LEDGER_BALANCE          = 1,
    AVAILABLE_BALANCE       = 2,
    REMAINING_THIS_CYCLE    = 20,
    CASH                    = 40,
    APPROVED_AMOUNT         = 53,
    AVAILABLE_CREDIT        = 90,
    CREDIT_LIMIT            = 91
    
}AmountType;


typedef enum  {
    SWIPE_OR_INSERT,
    SWIPE,
    INSERT,
    TAP
    
}CardMode;

typedef enum  {
    ENTERED,
    TIMEOUT,
    CANCELED,
    INVALID_LENGTH,
    BYPASS
    
}InputStatus;

typedef enum  {
    UNKNOWN     = -1,
    BANK_CARD   = 1,
    OTHER       = 2
    
}LoyaltyType;

typedef enum  {
    TRANSACTION     = 0,
    HISTORY         = 1,
    
}ReceiptType;


typedef enum  {
    UNKNOWN_RECEIPT_FORMAT = -1,
    MERCHANT = 0,
    BANK = 1,
    CUSTOMER = 2,
    REPRINT = 3,
    BALANCE = 4
    
}ReceiptFormat;


typedef enum  {
    UNKNOWN_TRANSACTION = -1,
    GOODS_AND_SERVICES = 1,
    REFUND_TRANSACTION = 2,
    CASH_BACK = 3,
    BALANCE_INQUIRY = 4,
    ACCOUNT_TRANSFER = 6,
    PAYMENT = 7,
    LOYALTY = 8,
    WITHDRAWAL = 9,
    VERIFY_DEVICE = 255,
    VOID_CREDIT = 10,
    REVERSAL = 11,
    GENERAL_TRANSFER = 12,
    CASH_DEPOSIT = 13,
    CASH_ADVANCE = 14
    
}TransactionType;


typedef enum  {
    UNKNOWN_TRANSACTION_STATUS = -1,
    APPROVED = 1,
    DECLINED = 2
    
}TransactionStatus;


typedef enum  {
    CRITICALLY_LOW ,
    LOW ,
    NORMAL
    
}BatteryStatus;


typedef enum  {
    PESA_POD ,
    PESA_POD_2 ,
    PESA_POD_2_PLUS
    
}DeviceType;

typedef enum
{
    pesaPOD = 1,
    pesaPRINT = 2
}PESA_PRINTER;

typedef enum
{
    Merchant  = 0,
    Bank  = 1,
    Customer = 2,
    Reprint = 3,
    Balance_Receipt = 4
    
}RECEIPT_FORMAT;

typedef enum  {
    SIGNATURE,
    RECIEPT
}TRANSACTION_RESULT;

typedef enum
{
    PESA_POD_Device,
    PESA_PLUG_Device
}MPOSDeviceType;

typedef enum  {
    CARDTYPE_MAGNETIC,
    CARDTYPE_ICC_CHIP,
    CARDTYPE_CONTACTLESS
}CARDTYPE;

typedef enum  {
    UpgradeVersionMandatory,
    UpgradeVersionOptional,
    VersionCheckFailedError,
    VersionCheckError,
    VersionCheckFirstError,
    VerifyMerchantRequestInput,
    VerifyMerchant,
    TransactionUnsupport,
    TransactionEnableBluetooth,
    PesaPodError,
    ProcessTLVError,
    LoyaltyError,
    NoInternet,
    SessionExpired,
    SomethingUnExpected,
    JsonProcessingError,
    PleaseCheckAfterSometime,
    SMARTPESAERROR_EMPTY_TRANSACTION_ID,
    SMARTPESAERROR_EMPTY_EMAIL_PHONE_NO,
    
    BLUETOOTH_DISCONNECTED,
    DEVICE_VERIFIED,
    AMOUNT_CANCELED,
    NO_CARD_DETECTED,
    
    TRANSACTION_CANCELLED,// NEED TO CHECK
    TRANSACTION_APPROVED,
    TRANSACTION_TERMINATED,
    TRANSACTION_DECLINED,
    TRANSACTION_CANCEL,
    TRANSACTION_CAPK_FAIL,
    TRANSACTION_NOT_ICC,
    TRANSACTION_SELECT_APP_FAIL,
    TRANSACTION_DEVICE_ERROR,
    TRANSACTION_ICC_CARD_REMOVED,
    TRANSACTION_CARD_BLOCKED,
    TRANSACTION_CARD_NOT_SUPPORTED,
    TRANSACTION_CONDITION_NOT_SATISFIED,
    TRANSACTION_INVALID_ICC_DATA,
    TRANSACTION_MISSING_MANDATORY_DATA,
    TRANSACTION_NO_EMV_APPS,
    TRANSACTION_ERROR_UNKNOWN,
    
    PIN_ENTRY_BYPASS,
    PIN_ENTRY_CANCEL,
    PIN_ENTRY_TIMEOUT,
    PIN_ENTRY_KEY_ERROR,
    PIN_ENTRY_NO_PIN,
    
    ENABLE_INPUT_AMOUNT_FAILED,
    DISABLE_INPUT_AMOUNT_FAILED,
    
    PHONE_ENTERED_ERROR,
    PHONE_ENTRY_TIMEOUT_ERROR,
    PHONE_ENTRY_CANCEL_ERROR,
    PHONE_ENTRY_WRONG_LENGTH_ERROR,
    PHONE_ENTRY_BYPASS_ERROR,
    
    EMV_FAILED_TO_GET_DATA,
    
    UNSUPPORTED_CARD,
    FAILED_TRANSACTION_AMOUNT,
    
    SMART_PESA_DEVICE_UNPLUGGED,
    
    COMMAND_NOT_AVAILABLE,
    //TIMEOUT,
    DEVICE_RESET,
    //UNKNOWN,
    DEVICE_BUSY,
    INPUT_OUT_OF_RANGE,
    INPUT_INVALID_FORMAT,
    INPUT_ZERO_VALUES,
    INPUT_INVALID,
    CASHBACK_NOT_SUPPORTED,
    CRC_ERROR,
    BTV4_NOT_SUPPORTED,
    COMM_ERROR,
    FAIL_TO_START_BTV4,
    INVALID_FUNCTION_IN_CURRENT_MODE,
    COMM_LINK_UNINITIALIZED,
    BTV4_ALREADY_STARTED,
    
    SMART_PESA_FAILED
}SMARTPESAERROR;

typedef enum PHONEENTRYSTATUS {
    PHONE_ENTERED,
    PHONE_ENTRY_TIMEOUT,
    PHONE_ENTRY_CANCEL,
    PHONE_ENTRY_WRONG_LENGTH,
    PHONE_ENTRY_BYPASS
}PHONEENTRYSTATUS;

typedef enum NOTIFICATIONTYPE {
    NOTIFICATIONTYPE_TRANSACTION,
    NOTIFICATIONTYPE_HISTORY
}NOTIFICATIONTYPE;

typedef enum
{
    APPROVED_STATUS = 1,
    DECLINED_STATUS = 2,
    TERMINATED = 3,
    CANCEL = 4,
    CAPK_FAIL = 5,
    NOT_ICC = 6,
    ICC_CARD_REMOVED = 7,
    DEVICE_ERROR = 8,
    SELECT_APP_FAIL = 9,
    APPLICATION_BLOCKED = 10
    
}TransactionResultStatus;


#endif /* SmartPesa_h */

