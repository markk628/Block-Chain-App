//
//  ViewController.swift
//  Blockchain Starter Project
//
//  Tutorial by Sai Kambampati on 4/29/18.
//  Tutorial done by Mark Kim on 3/26/20.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

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
//        Checks to see if the sender exists or has enough in their balance to make transaction.
//        if not, displays an UIAlert. Otherwise the money is sent
        if accounts[from] == nil {
            self.present(invalidAlert, animated: true, completion: nil)
            return
        } else if accounts[from]! - amount < 0 {
            self.present(invalidAlert, animated: true, completion: nil)
            return
        } else {
            accounts.updateValue(accounts[from]! - amount, forKey: from)
        }
        
//        Checks to see if reciever exists. If not, the function does nothing. Otherwise the money is
//        added to the reciever's balance
        if accounts[to] == nil {
            accounts.updateValue(amount, forKey: to)
        } else {
            accounts.updateValue(accounts[to]! + amount, forKey: to)
        }
        
//        Checks for the type of transaction. If the transaction invloves the Genesis Block,
//        a new Genesis Block is created. Otherwise a new Block is created
        if type == "genesis" {
            bitcoinChain.createGenesisBlock(data: "From: \(from); To: \(to); Amount: \(amount)BTC")
        } else if type == "normal" {
            bitcoinChain.createNewBlock(data: "From: \(from); To: \(to); Amount: \(amount)BTC")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func redMine(_ sender: Any) {
        
    }
    
    @IBAction func blueMine(_ sender: Any) {
        
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
