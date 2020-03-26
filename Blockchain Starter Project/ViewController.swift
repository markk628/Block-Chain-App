//
//  ViewController.swift
//  Blockchain Starter Project
//
//  Tutorial by Sai Kambampati on 4/29/18.
//  Tutorial done by Mark Kim on 3/26/20.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

/*
 #ViewController Class
 
 ##ViewController's Data
    - IBOutlets
        * blueAmount (UITextField)
        * redAmount (UITextField)
        * redLabel (UILabel)
        * blueLabel (UILable)
    - Variables/Constants
        * firstAccount (Hardcoded int)
        * secondAccount (Hardcoded int)
        * bitcoinChain (Blockchain)
        * reward (Hardcoded int)
        * accounts (An array of accounts. Has the account
          ID and balance)
        * invalidAlert (UIAlert)
 
 ##ViewController's Functions
    - transaction
        * First if-else checks to see if the sender exists
          or has enough in their balance to make transaction.
          If not, displays an UIAlert. Otherwise the money
          is sent.
        * Second if-else checks to see if reciever exists.
          If not, the function does nothing. Otherwise the
          money is added to the reciever's balance.
        * Third if-else checks for the type of transaction.
          If the transaction invloves the Genesis Block, a
          new Genesis Block is created. Otherwise a new Block
          is created.
    - chainState prints Block's number, hash, previous hash,
      and data. Also updates the UI.
    - chainValidity checks if the current Block's previous
      hash matches the previous Block's hash. For loop iterates
      through bitcoinChain's Blocks and checks if the current
      Blocks's previous hashes matches the previous Block's
      hash.
    - IBActions
        * redMine adds 100BTC to firstAccount
        * blueMine adds 100BTC to secondAccount

 */
class ViewController: UIViewController {
    
    @IBOutlet weak var blueAmount: UITextField!
    @IBOutlet weak var redAmount: UITextField!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    let firstAccount = 1065
    let secondAccount = 0217
    let bitcoinChain = Blockchain()
    let reward = 100
    var accounts: [String : Int] = ["0000": 10000000]
    let invalidAlert = UIAlertController(title: "Invalid Transaction", message: "Please check the details of your transaction as we were unable to process this.", preferredStyle: .alert)
    
    func transcation(from: String, to: String, amount: Int, type: String) {
        if accounts[from] == nil {
            self.present(invalidAlert, animated: true, completion: nil)
            return
        } else if accounts[from]! - amount < 0 {
            self.present(invalidAlert, animated: true, completion: nil)
            return
        } else {
            accounts.updateValue(accounts[from]! - amount, forKey: from)
        }
        
        if accounts[to] == nil {
            accounts.updateValue(amount, forKey: to)
        } else {
            accounts.updateValue(accounts[to]! + amount, forKey: to)
        }
        
        if type == "genesis" {
            bitcoinChain.createGenesisBlock(data: "From: \(from); To: \(to); Amount: \(amount)BTC")
        } else if type == "normal" {
            bitcoinChain.createNewBlock(data: "From: \(from); To: \(to); Amount: \(amount)BTC")
        }
    }

    func chainState() {
        for i in 0...bitcoinChain.chain.count-1 {
            print("\tBlock: \(bitcoinChain.chain[i].index!)\n\tHash: \(bitcoinChain.chain[i].hash!)\n\tPreviousHash: \(bitcoinChain.chain[i].previousHash!)\n\tData: \(bitcoinChain.chain[i].data!)")
        }
        redLabel.text = "Balance: \(accounts[String(describing: firstAccount)]!) BTC"
        blueLabel.text = "Balance: \(accounts[String(describing: secondAccount)]!) BTC"
        print(accounts)
        print(chainValidity())
    }

    func chainValidity() -> String {
        var isChainValid = true
        for i in 1...bitcoinChain.chain.count-1 {
            if bitcoinChain.chain[i].previousHash != bitcoinChain.chain[i-1].hash {
                isChainValid = false
            }
        }
        return "Chain is valid: \(isChainValid)\n"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transcation(from: "0000", to: "\(firstAccount)", amount: 50, type: "genesis")
        transcation(from: "\(firstAccount)", to: "\(secondAccount)", amount: 10, type: "normal")
        chainState()
        self.invalidAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func redMine(_ sender: Any) {
        transcation(from: "0000", to: "\(firstAccount)", amount: 100, type: "normal")
        print("New Block mined by \(firstAccount)")
        chainState()
    }
    
    @IBAction func blueMine(_ sender: Any) {
        transcation(from: "0000", to: "\(secondAccount)", amount: 100, type: "normal")
        print("New Block mined by \(secondAccount)")
        chainState()
    }
    
    @IBAction func redSend(_ sender: Any) {
        
    }
    
    @IBAction func blueSend(_ sender: Any) {
        
    }
    
}

extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
