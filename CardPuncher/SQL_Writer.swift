//
//  SQL_Writer.swift
//  CardPuncher
//
//  Created by Brock Swann on 2016-12-04.
//  Copyright © 2016 Brock Swann. All rights reserved.
//

import Foundation
import SQLite


class SQL_Writer {
    static let sharedSQL = SQLHandler()
    
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    
    var tableName = "someTable"
    
    let yourTable = Table("table")
    let name = Expression<String>("name")
    let email = Expression<String>("email")
    let stamps = Expression<Int64>("stamps")
    
    
    var length : Int = 0
    var db : Connection
    
    init() {
        db = try! Connection("\(path)/\(tableName).sqlite")
        
        try? db.run(yourTable.create(ifNotExists: true) { t in
            t.column(name)
            t.column(email)
            t.column(stamps)
        })
    }
    
    
    internal func createEntry(_ insertName : String, insertEmail : String){
        let insert = yourTable.insert(name <- insertName, email <- insertEmail, stamps <- 0)
        try! db.run(insert)
        //print("db entry created")
    }
    
    internal func createEntry(_ insertName : String, insertStamps : String, insertEmail : String){
        let s = insertStamps
        print(s)
        let c_Stamps = Int64(insertStamps)
        let insert = yourTable.insert(name <- insertName, email <- insertEmail, stamps <- c_Stamps!)
        try! db.run(insert)
        //print("db entry created")
    }
    
}
    
