//
//  tableVievController.swift
//  AlomaFire
//
//  Created by Alperen Dogu on 23.07.2018.
//  Copyright © 2018 Alperen Dogu. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import FirebaseDatabase
import Firebase
import FirebaseAuth
var nameText = String()



class tableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    var userNames:[String] = []
    var userPoints:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.dataSource = self
        
        userNames = userNameData
        userPoints = totalPointData
        print(userNameData)
        print(userPoints)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "  \(userPoints[indexPath.row])   ->    \(userNames[indexPath.row])"
        return cell
    }
}
