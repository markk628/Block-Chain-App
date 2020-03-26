//
//  Block.swift
//  Blockchain Starter Project
//
//  Tutorial by Sai Kambampati on 5/4/18.
//  Tutorial done by Mark Kim on 3/26/20.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

class Block {
//    Block's data
    var hash: String!
    var data: String!
    var previousHash: String!
    var index: Int!
    
//    generates a unique id
    func generateHash() -> String {
        return NSUUID().uuidString.replacingOccurrences(of: "-", with: "")
    }
}
