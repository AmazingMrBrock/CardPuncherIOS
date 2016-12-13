//
//  DEBUGViewController.swift
//  StampCard
//
//  Created by Brock Swann on 2016-05-03.
//  Copyright © 2016 Brock Swann. All rights reserved.
//

import UIKit

class DEBUGViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button_DeleteData(_ sender: AnyObject) {
        SQLHandler.sharedSQL.clearData()
    }

}
