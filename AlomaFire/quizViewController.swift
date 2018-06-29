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

class ViewController: UIViewController,UITextFieldDelegate {
    
    
    

    let baseUrl = "https://private-anon-2a496da62c-quizmasters.apiary-mock.com/questions"
    var questString: [String] = []
    var answerString: [String] = []
    var onlyAnswer: [[String]] = []
    var onlyBool: [[Bool]] = []
    var choiceOne: Bool = false
    var choiceTwo: Bool = false
    var choiceThree: Bool = false
    var choiceFour: Bool = false
    var userName = String()
    var trueFalse: Bool = false
    

    
    var i = 0
    var choiceNumOne = 0
    var choiceNumTwo = 0
    var totalPoint = 0
    
    var choiceStatue: Bool = false

    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblQuestionNum: UILabel!
    @IBOutlet weak var lblTotalPt: UILabel!
    @IBOutlet weak var viewResult: UIView!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer3: UIButton!
    @IBOutlet weak var btnAnswer4: UIButton!
    
    @IBOutlet weak var questionTrueFalseColorOne: UILabel!
    @IBOutlet weak var questionTrueFalseColorTwo: UILabel!
    @IBOutlet weak var questionTrueFalseColorThree: UILabel!
    @IBOutlet weak var questionTrueFalseColorFour: UILabel!
    @IBOutlet weak var questionTrueFalseColorFive: UILabel!
    @IBOutlet weak var questionTrueFalseColorSix: UILabel!
    @IBOutlet weak var questionTrueFalseColorSeven: UILabel!
    @IBOutlet weak var questionTrueFalseColorEight: UILabel!
    @IBOutlet weak var questionTrueFalseColorNine: UILabel!
    @IBOutlet weak var questionTrueFalseColorTen: UILabel!
    
    
    
    @IBAction func btnAnswer1(_ sender: UIButton) {
        if self.choiceOne == true {
            self.totalPoint += 10
            self.btnAnswer1.backgroundColor = UIColor.green
        }else if self.choiceTwo == true {
            self.btnAnswer1.backgroundColor = UIColor.red
            self.btnAnswer2.backgroundColor = UIColor.green
        }else if self.choiceThree == true {
            self.btnAnswer1.backgroundColor = UIColor.red
            self.btnAnswer3.backgroundColor = UIColor.green
        }else if self.choiceFour == true {
            self.btnAnswer1.backgroundColor = UIColor.red
            self.btnAnswer4.backgroundColor = UIColor.green
        }
        
        if (self.i < questString.count ) {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                self.changerForChoicesAndQuestion()
            })
        }else if(self.i == questString.count ){
            self.lblResult.text = "Your Total Point is: \(self.totalPoint)"
            viewResult.alpha = 1
        }
    }
    
    @IBAction func btnAnswer2(_ sender: UIButton) {
        if self.choiceTwo == true {
            self.totalPoint += 10
            self.btnAnswer2.backgroundColor = UIColor.green
        }else if self.choiceOne == true {
            self.btnAnswer2.backgroundColor = UIColor.red
            self.btnAnswer1.backgroundColor = UIColor.green
        }else if self.choiceThree == true {
            self.btnAnswer2.backgroundColor = UIColor.red
            self.btnAnswer3.backgroundColor = UIColor.green
        }else if self.choiceFour == true {
            self.btnAnswer2.backgroundColor = UIColor.red
            self.btnAnswer4.backgroundColor = UIColor.green
        }
        
        if (self.i < questString.count ) {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                self.changerForChoicesAndQuestion()
            })
        }else if(self.i == questString.count ){
            self.lblResult.text = "Total Point is: \(totalPoint)"
            viewResult.alpha = 1
        }
    }
    
    @IBAction func btnAnswer3(_ sender: UIButton) {
        if self.choiceThree == true {
            self.totalPoint += 10
            self.btnAnswer3.backgroundColor = UIColor.green
        }else if self.choiceOne == true {
            self.btnAnswer3.backgroundColor = UIColor.red
            self.btnAnswer1.backgroundColor = UIColor.green
        }else if self.choiceTwo == true {
            self.btnAnswer3.backgroundColor = UIColor.red
            self.btnAnswer2.backgroundColor = UIColor.green
        }else if self.choiceFour == true {
            self.btnAnswer3.backgroundColor = UIColor.red
            self.btnAnswer4.backgroundColor = UIColor.green
        }
        
        if (self.i < questString.count ) {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                self.changerForChoicesAndQuestion()
            })
        }else if(self.i == questString.count ){
            self.lblResult.text = "Total Point is: \(totalPoint)"
            viewResult.alpha = 1
        }
    }
    
    @IBAction func btnAnswer4(_ sender: UIButton) {
        if self.choiceFour == true {
            self.totalPoint += 10
            self.btnAnswer4.backgroundColor = UIColor.green
        }else if self.choiceOne == true {
            self.btnAnswer4.backgroundColor = UIColor.red
            self.btnAnswer1.backgroundColor = UIColor.green
        }else if self.choiceTwo == true {
            self.btnAnswer4.backgroundColor = UIColor.red
            self.btnAnswer2.backgroundColor = UIColor.green
        }else if self.choiceThree == true {
            self.btnAnswer4.backgroundColor = UIColor.red
            self.btnAnswer3.backgroundColor = UIColor.green
        }
        
        
        if (self.i < questString.count) {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                self.changerForChoicesAndQuestion()
            })
            
        }else if(self.i == questString.count ){
            self.lblResult.text = "\(userName) Total Point is: \(totalPoint)"
            viewResult.alpha = 1
        }
        
    }
    
    func changerForChoicesAndQuestion() {
        self.btnAnswer1.backgroundColor = UIColor.lightGray
        self.btnAnswer2.backgroundColor = UIColor.lightGray
        self.btnAnswer3.backgroundColor = UIColor.lightGray
        self.btnAnswer4.backgroundColor = UIColor.lightGray

        self.lblQuestion.text = self.questString[self.i]
        self.i += 1
        self.lblQuestionNum.text = "Question: \(i)"
        self.choiceNumOne += 1
        self.btnAnswer1.setTitle(self.onlyAnswer[self.choiceNumOne][self.choiceNumTwo],for: .normal)
        self.choiceOne = self.onlyBool[self.choiceNumOne][self.choiceNumTwo]
        self.choiceNumTwo += 1
        self.btnAnswer2.setTitle(self.onlyAnswer[self.choiceNumOne][self.choiceNumTwo], for: .normal)
        self.choiceTwo = self.onlyBool[self.choiceNumOne][self.choiceNumTwo]
        self.choiceNumTwo += 1
        self.btnAnswer3.setTitle(self.onlyAnswer[self.choiceNumOne][self.choiceNumTwo], for: .normal)
        self.choiceThree = self.onlyBool[self.choiceNumOne][self.choiceNumTwo]
        self.choiceNumTwo += 1
        self.btnAnswer4.setTitle(self.onlyAnswer[self.choiceNumOne][self.choiceNumTwo], for: .normal)
        self.choiceFour = self.onlyBool[self.choiceNumOne][self.choiceNumTwo]
        self.choiceNumTwo -= 3
        self.lblTotalPt.text = "Total Point is: \(self.totalPoint)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJSONData(url: baseUrl)
        lblResult.text = userName
        
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
                    self.onlyBool.insert(json["choices"].arrayValue.map({$0["correct"].boolValue}), at: 0)
                    
                    
                   
                    
                };
                
                
                
                
                
                if (self.i < 10) {
                    self.btnAnswer1.backgroundColor = UIColor.lightGray
                    self.btnAnswer2.backgroundColor = UIColor.lightGray
                    self.btnAnswer3.backgroundColor = UIColor.lightGray
                    self.btnAnswer4.backgroundColor = UIColor.lightGray

                    self.userName = self.lblResult.text!
                    self.lblQuestion.text = self.questString[self.i]
                    self.btnAnswer1.setTitle(self.onlyAnswer[self.choiceNumOne][self.choiceNumTwo],for: .normal)
                    self.choiceOne = self.onlyBool[self.choiceNumOne][self.choiceNumTwo]
                    self.choiceNumTwo += 1
                    self.btnAnswer2.setTitle(self.onlyAnswer[self.choiceNumOne][self.choiceNumTwo], for: .normal)
                    self.choiceTwo = self.onlyBool[self.choiceNumOne][self.choiceNumTwo]
                    self.choiceNumTwo += 1
                    self.btnAnswer3.setTitle(self.onlyAnswer[self.choiceNumOne][self.choiceNumTwo], for: .normal)
                    self.choiceThree = self.onlyBool[self.choiceNumOne][self.choiceNumTwo]
                    self.choiceNumTwo += 1
                    self.btnAnswer4.setTitle(self.onlyAnswer[self.choiceNumOne][self.choiceNumTwo], for: .normal)
                    self.choiceFour = self.onlyBool[self.choiceNumOne][self.choiceNumTwo]
                    self.choiceNumTwo -= 3

                    self.i = self.i+1
                    self.lblQuestionNum.text = "Question: \(self.i)"
                    self.lblTotalPt.text = "Total Point is: \(self.totalPoint)"
                   
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

