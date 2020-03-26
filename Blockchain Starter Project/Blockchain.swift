//
//  Blockchain.swift
//  Blockchain Starter Project
//
//  Tutorial by Sai Kambampati on 5/4/18.
//  Tutorial done by Mark Kim on 3/26/20.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

class Blockchain {
    var chain = [Block]()
    
    func createGenesisBlock(data: String) {
        let initialBlock = Block()
        initialBlock.hash = initialBlock.generateHash()
        initialBlock.data = data
        initialBlock.previousHash = "0000"
        initialBlock.index = 0
        chain.append(initialBlock)
    }
    
    func createNewBlock(data: String) {
        let newBlock = Block()
        newBlock.hash = newBlock.generateHash()
        newBlock.data = data
        newBlock.previousHash = chain[chain.count - 1].hash
        newBlock.index = chain.count
        chain.append(newBlock)
    }
}
