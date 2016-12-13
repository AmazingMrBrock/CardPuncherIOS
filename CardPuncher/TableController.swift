//
//  TableController.swift
//  StampCard
//
//  Created by Brock Swann on 2016-04-14.
//  Copyright © 2016 Brock Swann. All rights reserved.
//

import UIKit

class TableController: UITableViewController, UISearchResultsUpdating{
    internal static let tb = TableController()
    //let customerCardVC = CustomerCard(nibName: "CustomerCard", bundle: nil)
    
    
    // MARK: - Table view data source
    
    
    /*
     call nibs with this code 
     ViewDetailItem.loadFromNibNamed("NibName")
     */
    
    
    var tableData = [String]()
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()
    
    var currentCustomer: CustomerData = CustomerData()
    
    var table_Array = SQLHandler.sharedSQL.retrieveData()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            self.tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        table_Array = SQLHandler.sharedSQL.retrieveData()
        tableData = table_Array[0]
        filteredTableData = tableData
        
        
        
        //dump(table_Array)
        self.tableView.reloadData()
        //print("enter table view")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filteredTableData.count == 0{
            filteredTableData = tableData
        }
        
        return filteredTableData.count
    }
    
    @IBAction func unwindToVC(_ segue: UIStoryboardSegue) {
        table_Array = SQLHandler.sharedSQL.retrieveData()
        filteredTableData = table_Array[0]
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) 
        let row = (indexPath as NSIndexPath).row
        
        var cellLabelText = ""
        
        
        cellLabelText += filteredTableData[row]
        
        
        cell.textLabel?.text = cellLabelText
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let customerData = CustomerData()
        
        customerData.name = table_Array[0][(indexPath as NSIndexPath).row]
        customerData.email = table_Array[1][(indexPath as NSIndexPath).row]
        customerData.stamps = Int64(table_Array[2][(indexPath as NSIndexPath).row])!
        print(table_Array[0][(indexPath as NSIndexPath).row])
        
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "CustomerCardVC") as! CustomerCardVC
        vc.thisCustomer = customerData
        
        
        self.show(vc as UIViewController, sender: vc)
        
        
        
        //CustomerCardVC.cc.tableViewOut.reloadData()
        
        //customerCardVC.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        //presentViewController(customerCardVC, animated: true, completion: nil)
        
        //var x: nib_CustomerCard = (self.loadFromNibNamed("CustomerCard") as? nib_CustomerCard)!
        
        //var viewController = nib_CustomerCard(nibName: "CustomeCard", bundle: nil)
        
        //self.navigationController!.pushViewController(nib_CustomerCard(nibName: "CustomerCard", bundle: nil), animated: true );
        
    }
    
    func updateSearchResults(for searchController: UISearchController)
    {
        filteredTableData.removeAll(keepingCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (tableData as NSArray).filtered(using: searchPredicate)
        filteredTableData = array as! [String]
        
        self.tableView.reloadData()
    }
    
    //override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    //print ("inside prepare for segue")
    //if (segue.identifier == "CustomerCardVC") {
    ////get a reference to the destination view controller
    //let destinationVC:CustomerCardVC = segue.destinationViewController as! CustomerCardVC
    
    ////set properties on the destination view controller
    //destinationVC.thisCustomer = self.currentCustomer
    ////etc...
    //}
    //}
    
    
}
