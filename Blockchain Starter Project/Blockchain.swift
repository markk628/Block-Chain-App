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
//    Blockchain class is an array of Blocks
    var chain = [Block]()
    
//    creates the genesis block (the first block) of the block chain.
//    First the function initializes a Block class constant and assigns
//    it it's hash, data, previous hash, and index. Then the constant is appended
//    to the chain array.
    func createGenesisBlock(data: String) {
        let initialBlock = Block()
        initialBlock.hash = initialBlock.generateHash()
        initialBlock.data = data
        initialBlock.previousHash = "0000"
        initialBlock.index = 0
        chain.append(initialBlock)
    }
    
//    creates the following blocks of the block chain. First the function
//    initializes a Block class constant and assigns it it's hash, data,
//    previous, and index . The previous hash is assigned by getting the
//    hash of the last Block in the array. Then the constant is appended
//    to the chain array.
    func createNewBlock(data: String) {
        let newBlock = Block()
        newBlock.hash = newBlock.generateHash()
        newBlock.data = data
        newBlock.previousHash = chain[chain.count - 1].hash
        newBlock.index = chain.count
        chain.append(newBlock)
    }
}
