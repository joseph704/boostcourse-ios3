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
    
    var friends: [Friend] = []
    
    @IBAction func touchupButton(_ sender: UIButton){
        dates.append(Date())
        
//        self.tableView.reloadData()
        self.tableView.reloadSections(IndexSet(3...3), with: UITableView.RowAnimation.automatic)
    }
    var korea:[String] = ["가","나","다","라"]
    var english:[String] = ["A","B","C","D"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else { return }
        do {
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
    }
        
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korea.count
        case 1:
            return english.count
        case 2:
            return self.friends.count
        case 3:
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
        } else if indexPath.section == 2 {
            let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "jsonCell", for: indexPath)
            
            let Friend:Friend = friends[indexPath.row]
            
            cell.textLabel?.text = Friend.nameAndAge
            cell.detailTextLabel?.text = Friend.fullAddress
            
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
    
    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let nextViewController:SecondViewController = segue.destination as? SecondViewController else {
            return
        }
        
        guard let cell:UITableViewCell = sender as? UITableViewCell else{
            return
        }
        
        // SecondViewController의 textlabel property는 아직 메모리에 올라와 있지 않기때문에 에러발생!
        // nextViewController.textLabel.text = cell.textLabel?.text
        
        nextViewController.textToSet = cell.textLabel?.text
        
    }

}
