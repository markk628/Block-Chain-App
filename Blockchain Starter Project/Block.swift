//
//  Block.swift
//  Blockchain Starter Project
//
//  Tutorial by Sai Kambampati on 5/4/18.
//  Tutorial done by Mark Kim on 3/26/20.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

/*
 #Block Class
 
 ##Block's data
    - Hash (String)
    - Data (String)
    - Previous Hash (String)
    - Index (Int)
 
 ##Block's Funciton
    Returns a unique ID
 */
class Block {
    var hash: String!
    var data: String!
    var previousHash: String!
    var index: Int!
    
    func generateHash() -> String {
        return NSUUID().uuidString.replacingOccurrences(of: "-", with: "")
    }
}
