//
//  SecondViewController.swift
//  boostcourse03-ios
//
//  Created by 차요셉 on 11/01/2020.
//  Copyright © 2020 차요셉. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var textToSet:String?
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        textLabel.text=textToSet
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
