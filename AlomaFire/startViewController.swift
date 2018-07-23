//
//  startViewController.swift
//  AlomaFire
//
//  Created by Alperen Dogu on 29.06.2018.
//  Copyright © 2018 Alperen Dogu. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import FirebaseDatabase
import Firebase
import FirebaseAuth

var name:String = ""

class startViewController: UIViewController {
    
    var ref: DatabaseReference?
    var databaseHandle:DatabaseHandle?
    var userNameData = [String]()
    var totalPointData = [Int]()
    var tableViewData = [[String:Int]]()
    
    
    
    
    func dataBaseBam(){
       print(self.userNameData)
        print(self.totalPointData)
    }
    @IBAction func totalPoints(_ sender: Any) {
        dataBaseBam()
    }
    @IBOutlet weak var userNameField: UITextField!
    @IBAction func startButton(_ sender: Any, forEvent event: UIEvent) {
    }
    @IBAction func userChanged(_ sender: Any) {
        name = userNameField.text!
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let referanceURL:String = "https://quizapp-alpi.firebaseio.com/"
        ref = Database.database().reference(fromURL: referanceURL)
        databaseHandle = ref?.child("userResults").observe(.childAdded, with: { (snapshot) in
            let namePost = snapshot.value as? String
            //take the value from snapshot and add to array
            if let actualNamePost = namePost {
            self.userNameData.append(actualNamePost)
            }
        })
        
        databaseHandle = ref?.child("userPoints").observe(.childAdded, with: { (snapshot) in
            let pointPost = snapshot.value as? Int
            //take the value from snapshot and add to array
            if let actualPointPost = pointPost{
                self.totalPointData.append(actualPointPost)
            }
        })
    }
}
