//
//  CustomerCardVC.swift
//  StampCard
//
//  Created by Brock Swann on 2016-05-12.
//  Copyright © 2016 Brock Swann. All rights reserved.
//

import UIKit

class CustomerCardVC: UIViewController , UITableViewDataSource, UITableViewDelegate {
    open static let cc = CustomerCardVC()
    
    
    @IBOutlet weak var tableViewOut: UITableView!
    
    var thisCustomer: CustomerData = CustomerData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    //public func setCustomerData (thisCustomerData: CustomerData){
    //thisCustomer = thisCustomerData
    ////self.tableViewOut..
    ////reloadData()
    //}
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int ) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell {
        if (indexPath as NSIndexPath).row == 0{
            //thisCustomer = TableController.tb.currentCustomer
            print("Inside if 0. thisCustomer.name = " + thisCustomer.name)
            let cell = tableViewOut.dequeueReusableCell(withIdentifier: "protoInfo", for: indexPath) 
            
            let row = (indexPath as NSIndexPath).row
            cell.textLabel?.text = "Name: \(thisCustomer.name)"
            return cell
        }
        else if (indexPath as NSIndexPath).row == 1{
            //print("Inside if cell 0")
            let cell = tableViewOut.dequeueReusableCell(withIdentifier: "protoInfo", for: indexPath) 
            
            let row = (indexPath as NSIndexPath).row
            cell.textLabel?.text = "Email: \(thisCustomer.email)"
            return cell
        }
        else if (indexPath as NSIndexPath).row == 2{
            //print("Inside if cell 0")
            let cell = tableViewOut.dequeueReusableCell(withIdentifier: "protoInfo", for: indexPath) 
            
            let row = (indexPath as NSIndexPath).row
            cell.textLabel?.text = "Stamps: \(String(thisCustomer.stamps))"
            
            return cell
        }
        return TableViewCell()
    }
    
}
