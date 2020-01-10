//
//  ViewController.swift
//  boostcourse03-ios
//
//  Created by 차요셉 on 10/01/2020.
//  Copyright © 2020 차요셉. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var dates = [Date]()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()
    
    
    @IBAction func touchupButton(_ sender: UIButton){
        dates.append(Date())
        
//        self.tableView.reloadData()
        self.tableView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)
    }
    var korea:[String] = ["가","나","다","라"]
    var english:[String] = ["A","B","C","D"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korea.count
        case 1:
            return english.count
        case 2:
            return dates.count
        default:
            return 0
        }
        
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section < 2 {
            let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let text:String = indexPath.section == 0 ? korea[indexPath.row] : english[indexPath.row]
            cell.textLabel?.text = text
            return cell
        } else {
            let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
            
            cell.leftLable.text = self.dateFormatter.string(from: dates[indexPath.row])
            cell.rightLable.text = self.timeFormatter.string(from: dates[indexPath.row])
            return cell
        }
       
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 2 {
            return section == 0 ? "한글" : "영어"
        }
        return nil
    }
}

