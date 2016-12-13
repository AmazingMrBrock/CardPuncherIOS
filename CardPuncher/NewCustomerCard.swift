 //
 //  NewCustomerCard.swift
 //  StampCard
 //
 //  Created by Brock Swann on 2016-05-05.
 //  Copyright © 2016 Brock Swann. All rights reserved.
 //
 
 import UIKit
 
 class NewCustomerCard: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table_NewCustomerCard: UITableView!
    
    var rowCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == table_NewCustomerCard{
            return 3
        }
        return Int()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if tableView == table_NewCustomerCard{
            if (indexPath as NSIndexPath).row == 0{
                //print("Inside if c ell 0")
                let cell = table_NewCustomerCard.dequeueReusableCell(withIdentifier: "proto_Name", for: indexPath) 
                
                let row = (indexPath as NSIndexPath).row
                
                return cell
            }
            else if (indexPath as NSIndexPath).row == 1{
                //print("Inside if cell 1")
                let cell = table_NewCustomerCard.dequeueReusableCell(withIdentifier: "proto_Stamps", for: indexPath) 
                
                let row = (indexPath as NSIndexPath).row
                
                return cell
            }
            else if (indexPath as NSIndexPath).row == 2{
                //print("Inside if cell 2")
                let cell = table_NewCustomerCard.dequeueReusableCell(withIdentifier: "proto_Email", for: indexPath) 
                
                let row = (indexPath as NSIndexPath).row
                
                return cell
            }
        }
        
        print("Outside if")
        return UITableViewCell()
    }
    
    @IBAction func button_Create(_ sender: AnyObject) {
        print("customer inserting into database.")
        //let thisTable = table_NewCustomerCard.numberOfRowsInSection(0) as Int
        
        let tableCount = table_NewCustomerCard.numberOfRows(inSection: 0) as Int
        var name = ""
        var stamps = ""
        var email = ""
        
        for let row in (0..<tableCount){
            let index = IndexPath(row: row, section: 0)
            let cell = table_NewCustomerCard.cellForRow(at: index) as! protoNewCustomerCell
            if(row == 0) {
                name = cell.editText_Field.text!
            }
            else if(row == 1) {
                stamps = cell.editText_Field.text!
            }
            else if(row == 2) {
                email = cell.editText_Field.text!
            }
        }
        
        print("customer inserting into database.")
        
        SQLHandler.sharedSQL.createEntry(name, insertStamps: stamps, insertEmail: email)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func button_Clear(_ sender: AnyObject) {
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
 }
