//
//  ViewController.swift
//  AlomaFire
//
//  Created by Alperen Dogu on 22.06.2018.
//  Copyright © 2018 Alperen Dogu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    let baseUrl = "https://private-anon-2a496da62c-quizmasters.apiary-mock.com/questions"
    var questString: [String] = []
    var answerString: [String] = []
    var onlyAnswer: [[String]] = []
    var onlyBool: [[String]] = []
    var answer1: [String] = []
    
    
    var questAnswerString: [(String,String,[(String)],[(Bool)])] = []
    var boolAnswerString: [(String,Bool)] = []

    
    var i = 0
    var a = 0
    var b = 0
    var totalPoint = 0

    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblQuestionNum: UILabel!
    @IBOutlet weak var lblTotalPt: UILabel!
    @IBOutlet weak var viewResult: UIView!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer3: UIButton!
    @IBOutlet weak var btnAnswer4: UIButton!
    
    
    @IBAction func btnStart(_ sender: UIButton) {
        
    }
    
    @IBAction func btnAnswer1(_ sender: UIButton) {
        
        if (self.i < questString.count ) {
            
            //print (i)
            self.lblQuestion.text = self.questString[self.i]
//            self.btnAnswer1.setTitle(self.onlyAnswer[self.a], for: .normal)
            self.a += 1
            self.i += 1
            self.lblQuestionNum.text = "Question: \(i)"
        }else if(self.i == questString.count ){
            self.lblResult.text = "Total Point is: \(a)"
             self.lblResult.text = "Your Total Point is: \(self.totalPoint)"
            viewResult.alpha = 1
        }
    }
    
    @IBAction func btnAnswer2(_ sender: UIButton) {
        
        if (self.i < questString.count ) {
            //print (i)
            self.lblQuestion.text = self.questString[self.i]
            self.i = self.i+1
            self.lblQuestionNum.text = "Question: \(i)"
        }else if(self.i == questString.count ){
            self.lblResult.text = "Total Point is: \(a)"
            viewResult.alpha = 1
        }
    }
    
    @IBAction func btnAnswer3(_ sender: UIButton) {
        
        if (self.i < questString.count ) {
            //print (i)
            self.lblQuestion.text = self.questString[self.i]
            self.i = self.i+1
            self.lblQuestionNum.text = "Question: \(i)"
        }else if(self.i == questString.count ){
            self.lblResult.text = "Total Point is: \(a)"
            viewResult.alpha = 1
        }
    }
    
    @IBAction func btnAnswer4(_ sender: UIButton) {
        
        if (self.i < questString.count ) {
            //print (i)
            self.lblQuestion.text = self.questString[self.i]
            self.i = self.i+1
            self.lblQuestionNum.text = "Question: \(i)"
        }else if(self.i == questString.count ){
            self.lblResult.text = "Total Point is: \(a)"
            viewResult.alpha = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJSONData(url: baseUrl)
        
        
    }
    
    func getJSONData(url: String) {
        
        Alamofire.request(url, method: .get).responseJSON { response in
            if response.result.isSuccess {
                let jsonData : JSON = JSON(response.result.value!)
                //print(jsonData)
               
                
                
                
                for json in jsonData.arrayValue{
                    //print("\(json["question"])")
                    //print("\(json["choices"])")
                    //print(json["choices"]["choice"])
                    //print(json["choice"])
                   
                    self.questString.insert("\(json["question"])", at: 0)
                    self.answerString.insert("\(json["choices"])", at: 0)
                    self.onlyAnswer.insert(json["choices"].arrayValue.map({$0["choice"].stringValue}), at: 0)
                    self.onlyBool.insert(json["choices"].arrayValue.map({$0["correct"].stringValue}), at: 0)
                    
                    
                   
                    
                };
                
                
                if (self.i < 10) {
                    self.lblQuestion.text = self.questString[self.i]
                    self.btnAnswer1.setTitle(self.onlyAnswer[self.a][0],for: .normal)
                    self.btnAnswer2.setTitle(self.onlyAnswer[self.a][1], for: .normal)
                    self.btnAnswer3.setTitle(self.onlyAnswer[self.a][2], for: .normal)
                    self.btnAnswer4.setTitle(self.onlyAnswer[self.a][3], for: .normal)

                    self.a += 1
                    self.i = self.i+1
                    self.lblQuestionNum.text = "Question: \(self.i)"
                    self.lblTotalPt.text = "Total Point is: \(self.a)"
                   
                }
                
                
                
                
                
            } else {
                print("Error: \(String(describing: response.result.error))")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

