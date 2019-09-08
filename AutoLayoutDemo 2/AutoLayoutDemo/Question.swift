//
//  Question.swift
//  AutoLayoutDemo
//
//  Created by Zhang Qiuhao on 7/22/19.
//  Copyright © 2019 Jason Chen. All rights reserved.
//

import UIKit

class Question: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    //@IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    var receivedQuestion: String?
    var receivedRow: Array<Int> = []
    var receivedBank: Array<AnwserableQuestion> = []
    var currentQuestion: AnwserableQuestion = AnwserableQuestion()
    var right = 0
    var wrong = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setButton()
        for q in receivedBank {
            print (q.question)
        }
    }
    
    func setButton() {
        questionLabel.text = receivedQuestion
        aButton.setTitle("A. " + String(receivedRow[0]), for: .normal)
        bButton.setTitle("B. " + String(receivedRow[1]), for: .normal)
        cButton.setTitle("C. " + String(receivedRow[2]), for: .normal)
        dButton.setTitle("D. " + String(receivedRow[3]), for: .normal)
        aButton.backgroundColor = UIColor.orange
        bButton.backgroundColor = UIColor.orange
        cButton.backgroundColor = UIColor.orange
        dButton.backgroundColor = UIColor.orange
    }
    
    func findQuestion() {
        for ques in receivedBank {
            if (ques.question == receivedQuestion) {
                currentQuestion = ques
            }
        }
    }
    
    func buttonsUnclicked() -> Bool {
        if (aButton.backgroundColor == bButton.backgroundColor && bButton.backgroundColor == cButton.backgroundColor && cButton.backgroundColor == dButton.backgroundColor) {
            return true
        }else {
            return false
        }
    }
    
    @IBAction func aButtonClicked(_ sender: Any) {
        findQuestion()
        guard (buttonsUnclicked())
        else {
                return
        }
        if (receivedRow[0] == currentQuestion.correctAnswer) {
            aButton.backgroundColor = UIColor.green
            right += 1
        }else {
            aButton.backgroundColor = UIColor.red
            wrong += 1
        }
        
    }
    @IBAction func bButtonClicked(_ sender: Any) {
        findQuestion()
        guard (buttonsUnclicked())
        else {
                return
        }
        if (receivedRow[1] == currentQuestion.correctAnswer) {
            bButton.backgroundColor = UIColor.green
            right += 1
        }else {
            bButton.backgroundColor = UIColor.red
            wrong += 1
        }
            
        
    }
    @IBAction func cButtonClicked(_ sender: Any) {
        findQuestion()
        guard (buttonsUnclicked())
        else {
                return
        }
        if (receivedRow[2] == currentQuestion.correctAnswer) {
            cButton.backgroundColor = UIColor.green
            right += 1
        }else {
            cButton.backgroundColor = UIColor.red
            wrong += 1
        }
    }
    @IBAction func dButtonClicked(_ sender: Any) {
        findQuestion()
        guard (buttonsUnclicked())
        else {
            return
        }
        if (receivedRow[3] == currentQuestion.correctAnswer) {
            dButton.backgroundColor = UIColor.green
            right += 1
        }else {
            dButton.backgroundColor = UIColor.red
            wrong += 1
        }
    }
    @IBAction func nextButtonClicked(_ sender: Any) {
        guard (receivedBank.last?.question != receivedQuestion)
        else {
            performSegue(withIdentifier: "finish", sender: self)
            return
        }
        for i in 0...receivedBank.count-2 {
            if receivedBank[i].question == receivedQuestion {
                receivedQuestion = receivedBank[i+1].question
                receivedRow = Array(receivedBank[i+1].answer)
                setButton()
                break
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "finish") {
            if let vc = segue.destination as? FinalGrade {
                vc.receivedRight = right
                vc.receivedWrong = wrong
            }
        }
    }
}

