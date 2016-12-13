//
//  SQL_Tools.swift
//  CardPuncher
//
//  Created by Brock Swann on 2016-12-04.
//  Copyright © 2016 Brock Swann. All rights reserved.
//

import Foundation
import SQLite

class SQL_Tools{
    
    open func clearData(){
        try? db.run(yourTable.delete())
        
    }
}
