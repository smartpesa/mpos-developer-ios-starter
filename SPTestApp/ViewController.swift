//
//  ViewController.swift
//  SPTestApp
//
//  Created by Arun on 30/4/19.
//  Copyright © 2019 Arun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    private var userInfo:VerifyMerchantInfo? = nil
    
    @IBOutlet weak var getVersionBtn: UIButton!
    @IBOutlet weak var verifyMerchantBtn: UIButton!
    @IBOutlet weak var startTransactionBtn: UIButton!

    @IBOutlet weak var statusLbl: UILabel!


    public func printInfo(_ message: String, file: String = #file, function: String = #function, line: Int = #line ) {
        print("🍎 \(message) from \(function) \(file):\(line)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.printInfo("")
        self.statusLbl.text = ""
        self.toggleStatusForVerifyMerchant(disable: true)
        self.toggleStatusForStartTransaction(disable: true)
    }
    
    
    @IBAction func getVersionAction(_ sender: Any) {
        self.printInfo("")
        SmartPesaSDK.sharedInstance()?.getVersion({ (versionResposne) in
            self.toggleStatusForVerifyMerchant(disable: false)
            self.getVersionBtn.backgroundColor = UIColor.green
        }, { (versionError) in
            self.toggleStatusForVerifyMerchant(disable: true)
            self.getVersionBtn.backgroundColor = UIColor.red
        })
    }
    
    @IBAction func verifyMerchantAction(_ sender: Any) {
        self.printInfo("")
        SmartPesaSDK.sharedInstance()?.verifyMerchant("10012", andOperatorID: "100", withMerchantCode: "123456", { (resposne) in
            
            if let merchantInfo = resposne?.verifyMerchantInfo{
                self.userInfo = merchantInfo
                self.toggleStatusForStartTransaction(disable: false)
                self.verifyMerchantBtn.backgroundColor = UIColor.green
            }
        }, { (error) in
            self.toggleStatusForStartTransaction(disable: true)
            self.verifyMerchantBtn.backgroundColor = UIColor.red
        })
    }
    
    @IBAction func startTransactionAction(_ sender: Any) {
        self.printInfo("")
        let param = self.getTransactionTerminalParam()
        SmartPesaSDK.sharedInstance()?.startTransaction(with: param)
    }
    
    func toggleStatusForVerifyMerchant(disable:Bool){
        
        if(disable == true){
            self.verifyMerchantBtn.isUserInteractionEnabled = false
            self.verifyMerchantBtn.alpha = 0.5
        }
        else{
            self.verifyMerchantBtn.isUserInteractionEnabled = true
            self.verifyMerchantBtn.alpha = 1.0
        }
    }
    
    func toggleStatusForStartTransaction(disable:Bool){
        
        if(disable == true){
            self.startTransactionBtn.isUserInteractionEnabled = false
            self.startTransactionBtn.alpha = 0.5
        }
        else{
            self.startTransactionBtn.isUserInteractionEnabled = true
            self.startTransactionBtn.alpha = 1.0
        }
    }
    
    func getTransactionTerminalParam() -> TransactionTerminalParam{
        let param : TransactionTerminalParam = TransactionTerminalParam()
        param.amount = 20.0
        param.cashBack = 0.0
        param.tipAmount = 2.0
        param.to = DEFAULT
        param.from = DEFAULT
        param.deviceType = PESA_POD_2_PLUS
        param.bleDelegate = self
        param.transactionDelegate = self
        
        return param
    }
}

extension ViewController: SmartPesaBLEDelegate{
    func bluetoothScanTimeout(_ message: String!) {
        self.printInfo(message)
    }
    
    func bluetoothConnectTimeout(_ message: String!) {
        self.printInfo(message)

    }
    
    func brequestEnableBluetoothInSettings() {
        self.printInfo("")
    }
    
    func devicesFound(_ devices: [Any]!) {
        self.printInfo("")
        
        let transType: TransactionType = self.userInfo!.transaction_types!.last as! TransactionType
        
        SmartPesaSDK.sharedInstance().performTransaction(with:transType , using: devices.first as? NSObject)
    }
    
    func onDeviceConnected(_ device: NSObject!) {
        self.printInfo("")
    }
    
    func onBLEError(_ error: SmartPesaError!) {
        self.printInfo("")
    }
    
    func onDeviceDisconnected() {
        self.printInfo("")
    }
}

extension ViewController: SmartPesaTerminalTransactionDelegate{
    func bluetoothDisconnected(_ mErrorText: String!, _ errorValue: SmartPesaErrorCode) {
        self.printInfo("")

    }
    
    func showConfirmInputPrompt() {
        self.printInfo("")
        self.statusLbl.text = "showConfirmInputPrompt"

    }
    
    func onProgressTextUpdate(_ message: String!) {
        self.printInfo(message)
        self.statusLbl.text = message


    }
    
    func onCardInserted(_ message: String!) {
        self.printInfo(message)
        self.statusLbl.text = message
    }
    
    func showInsertChipAlertPrompt() {
        self.printInfo("")
    }
    
    func onWaiting(forCard message: String!) {
        self.printInfo(message)
        self.statusLbl.text = message
    }
    
    func updateCardUI(_ card: Card!) {
        self.printInfo("")
    }
    
    func onAmountConfirmed(_ isConfirmed: Bool) {
        self.printInfo("")

    }
    
    func onReturnPhoneNumber(_ status: PHONEENTRYSTATUS) {
        self.printInfo("")
    }
    
    func showSelectAppAlertPromptIfNecessary(_ applist: [Any]!) {
        self.printInfo("")

    }
    
    func showConfirmAmountPrompt() {
        self.printInfo("")
        self.statusLbl.text = "showConfirmAmountPrompt"

    }
    
    func cancelSetAmount() {
        self.printInfo("")

    }
    
    func showPinAlertPrompt() {
        self.printInfo("")

    }
    
    func onPinEntered() {
        self.statusLbl.text = "onPinEntered"
        self.printInfo("")

    }
    
    func onError(_ error: SmartPesaError!) {
        self.printInfo("")
    }
    
    func onShowConfirmFeePrompt(_ feeType: FeeChargeType, with currency: Currency!, feeAmount: Double, finalAmount: Double, _ finishBlock: ((Bool) -> Void)!) {
        self.printInfo("")
    }
    
    func onReversalTransactionFinished(_ response: Transaction!) {
        self.printInfo("")
    }
    
    func onTransactionFinished(_ response: Transaction!, success isSuccess: Bool, _ message: String!) {
        self.printInfo("")
        self.statusLbl.text = "onTransactionFinished \(isSuccess ? "Success" : "Failed")"
    }
    
    func show(_ balance: Balance!) {
        self.printInfo("")
    }
    
    
}

